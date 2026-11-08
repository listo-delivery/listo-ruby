# frozen_string_literal: true

require "json"
require "openssl"

module ListoDelivery
  # Checks that a webhook really came from Listo. Mirrors the server's own
  # signing rule:
  #
  #   X-Listo-Signature: t=<unix seconds>,v1=<hex hmac-sha256 over "<t>.<raw body>">
  #
  # Pass the RAW body exactly as received, never re-serialized JSON, and
  # every secret that is currently active (two during a rotation).
  #
  #   event = ListoDelivery::Webhooks.construct_event(request.body.read, request.headers["X-Listo-Signature"], secret)
  module Webhooks
    HEADER = "X-Listo-Signature"
    DEFAULT_TOLERANCE = 300
    PATTERN = /\At=(\d+),v1=(\h+)\z/

    # True only when the header is a well formed signature over the body,
    # made within `tolerance` seconds of `now` (either direction), under any
    # of the secrets. Never raises: anything malformed is false.
    #
    # @param raw_body [String]
    # @param signature_header [String, nil]
    # @param secrets [String, Array<String>]
    # @param tolerance [Integer] seconds
    # @param now [Integer, Time, nil] unix seconds; defaults to the current time
    def self.verify(raw_body, signature_header, secrets, tolerance: DEFAULT_TOLERANCE, now: nil)
      usable = Array(secrets).map(&:to_s).reject { |s| s.strip.empty? }
      return false if usable.empty?

      match = PATTERN.match(signature_header.to_s)
      return false if match.nil?

      timestamp = match[1].to_i
      return false if (now_seconds(now) - timestamp).abs > tolerance.to_i

      given = match[2]
      usable.any? { |secret| secure_equal?(digest(timestamp, raw_body, secret), given) }
    rescue ArgumentError, TypeError, EncodingError
      false
    end

    # Verifies, then parses the body into the event class its `type` names
    # (a type this SDK does not know comes back as a plain
    # Models::WebhookEvent).
    #
    # @raise [ListoDelivery::SignatureError] when the signature does not verify
    # @return [Models::WebhookEvent]
    def self.construct_event(raw_body, signature_header, secrets, tolerance: DEFAULT_TOLERANCE, now: nil)
      raise SignatureError unless verify(raw_body, signature_header, secrets, tolerance: tolerance, now: now)

      parsed = JSON.parse(raw_body.to_s)
      unless parsed.is_a?(Hash)
        raise Error.new("The webhook body is not a JSON object.", code: "invalid_payload", retryable: false)
      end

      Models::WebhookEvent.build(parsed)
    rescue JSON::ParserError
      raise Error.new("The webhook body is not valid JSON.", code: "invalid_payload", retryable: false)
    end

    # The signed string is "<t>.<raw body>" over the bytes as received.
    def self.digest(timestamp, raw_body, secret)
      OpenSSL::HMAC.hexdigest("SHA256", secret.to_s.b, "#{timestamp}.".b + raw_body.to_s.b)
    end

    # The length check comes first because the constant-time comparison
    # raises on unequal lengths, and a truncated signature is just invalid.
    def self.secure_equal?(expected, given)
      return false unless expected.bytesize == given.bytesize

      OpenSSL.fixed_length_secure_compare(expected, given)
    end

    def self.now_seconds(now)
      (now || Time.now).to_i
    end

    private_class_method :digest, :secure_equal?, :now_seconds
  end

  module Resources
    # The webhook operations (generated) plus the signature helpers, so
    # `client.webhooks.verify(...)` reads like the rest of the client.
    class Webhooks
      def verify(...)
        ListoDelivery::Webhooks.verify(...)
      end

      def construct_event(...)
        ListoDelivery::Webhooks.construct_event(...)
      end
    end
  end
end
