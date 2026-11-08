# frozen_string_literal: true

require "json"
require "net/http"
require "openssl"
require "securerandom"
require "time"
require "uri"

module ListoDelivery
  # The entry point: one Client per API key.
  #
  #   client = ListoDelivery::Client.new(api_key: ENV.fetch("LISTO_API_KEY"))
  #   client.deliveries.retrieve("dlv_...")
  #
  # Resources (`deliveries`, `stores`, ...) and the root `ping` come from
  # ClientOperations (generated); `client.webhooks` carries both the webhook
  # operations and the signature helpers (`verify`, `construct_event`).
  class Client
    include ClientOperations

    KEY_PREFIXES = {"lst_live_" => "live", "lst_test_" => "test"}.freeze
    MAX_RETRY_WAIT = 60
    DEFAULT_RETRY_WAIT = 1
    # Transport failures that mean "no answer arrived".
    NETWORK_ERRORS = [
      SocketError, SystemCallError, IOError, Timeout::Error, OpenSSL::SSL::SSLError,
      Net::HTTPBadResponse, Net::ProtocolError
    ].freeze

    # @return [String] "live" or "test", read from the key's prefix
    attr_reader :mode
    attr_reader :base_url, :max_retries, :timeout

    # @param api_key [String] a `lst_live_` or `lst_test_` key
    # @param base_url [String, nil] defaults to the schema's server
    # @param max_retries [Integer] how many times a 429 is retried (0 = never)
    # @param timeout [Numeric] seconds for connecting, writing and reading
    def initialize(api_key:, base_url: nil, max_retries: 0, timeout: 30)
      @mode = KEY_PREFIXES.find { |prefix, _| api_key.is_a?(String) && api_key.start_with?(prefix) }&.last
      raise ArgumentError, "api_key must start with lst_live_ or lst_test_" unless @mode
      raise ArgumentError, "max_retries must be a non-negative Integer" unless max_retries.is_a?(Integer) && max_retries >= 0
      raise ArgumentError, "timeout must be a positive number" unless timeout.is_a?(Numeric) && timeout.positive?

      @api_key = api_key
      @base_url = (base_url || DEFAULT_BASE_URL).to_s.chomp("/")
      raise ArgumentError, "base_url must be an http(s) URL" unless URI.parse(@base_url).is_a?(URI::HTTP)

      @max_retries = max_retries
      @timeout = timeout
    end

    # The key never shows up in logs or exception output.
    def inspect
      "#<#{self.class.name} mode=#{mode.inspect} base_url=#{base_url.inspect}>"
    end

    # Runs one operation. The generated resource methods call this; it is
    # not meant for direct use.
    # @api private
    def execute(http_method, path, query: nil, body: nil, idempotent: false, idempotency_key: nil, model: nil)
      check_idempotency_key(idempotency_key)
      uri = URI.parse("#{base_url}#{path}")
      uri.query = Util.encode_query(query) if query && !query.empty?
      payload = body.nil? ? nil : JSON.generate(body)
      headers = request_headers(payload, idempotent ? (idempotency_key || SecureRandom.uuid) : nil)

      attempts = 0
      loop do
        response = perform(http_method, uri, headers, payload)
        if response.code.to_i == 429 && attempts < max_retries
          attempts += 1
          sleep(retry_delay(response))
          next
        end
        return handle(response, model)
      end
    end

    private

    # nil means "mint one"; a key that is present must be a real one, since
    # an empty header would defeat the retry protection it stands for.
    def check_idempotency_key(key)
      return if key.nil?
      return if key.is_a?(String) && !key.strip.empty?

      raise ArgumentError, "idempotency_key must be a non-blank String"
    end

    def request_headers(payload, idempotency_key)
      agent = "listo-ruby/#{VERSION} api/#{API_VERSION}"
      headers = {
        "Authorization" => "Bearer #{@api_key}",
        "Accept" => "application/json",
        "User-Agent" => agent,
        "X-Listo-Client" => agent
      }
      headers["Content-Type"] = "application/json" if payload
      headers["Idempotency-Key"] = idempotency_key if idempotency_key
      headers
    end

    def perform(http_method, uri, headers, payload)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.open_timeout = http.read_timeout = http.write_timeout = timeout
      has_body = !payload.nil? || %w[POST PUT PATCH].include?(http_method)
      request = Net::HTTPGenericRequest.new(http_method, has_body, true, uri.request_uri, headers)
      # An empty body still sends Content-Length: 0, which a POST needs.
      request.body = payload || "" if has_body
      http.start { |conn| conn.request(request) }
    rescue *NETWORK_ERRORS => e
      raise ConnectionError, "Could not reach the Listo API (#{e.class}: #{e.message})"
    end

    # Retry-After is whole seconds or an HTTP date; anything else waits a second.
    def retry_delay(response)
      value = response["retry-after"].to_s.strip
      seconds =
        if value.match?(/\A\d+\z/)
          value.to_i
        else
          begin
            Time.httpdate(value) - Time.now
          rescue ArgumentError
            DEFAULT_RETRY_WAIT
          end
        end
      seconds.clamp(0, MAX_RETRY_WAIT)
    end

    def handle(response, model)
      status = response.code.to_i
      text = response.body.to_s
      parsed = parse(text)
      raise api_error(response, status, text, parsed) unless status.between?(200, 299)
      return nil if status == 204 || text.strip.empty?
      raise api_error(response, status, text, parsed) if parsed == :invalid

      model ? model.build(parsed) : parsed
    end

    def parse(text)
      return nil if text.strip.empty?

      JSON.parse(text)
    rescue JSON::ParserError
      :invalid
    end

    def api_error(response, status, text, parsed)
      header_id = response["x-request-id"]
      envelope = parsed.is_a?(Hash) ? parsed["error"] : nil
      if envelope.is_a?(Hash) && envelope["code"].is_a?(String)
        return Error.new(
          envelope["message"].to_s, code: envelope["code"], param: envelope["param"],
          retryable: envelope["retryable"], status: status, request_id: envelope["request_id"] || header_id,
          doc_url: envelope["doc_url"], body: parsed
        )
      end

      Error.new(
        "Unexpected response with status #{status}",
        code: "http_#{status}", retryable: [429, 502, 503, 504].include?(status), status: status,
        request_id: header_id, body: (parsed == :invalid || parsed.nil?) ? text : parsed
      )
    end
  end
end
