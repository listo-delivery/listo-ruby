# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.43.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One call with what was sent and what came back.
    class RequestLogDetail < Model
      TYPES = {
        "id" => nil,
        "method" => nil,
        "path" => nil,
        "endpoint" => nil,
        "status" => nil,
        "error_code" => nil,
        "duration_ms" => nil,
        "request_id" => nil,
        "api_key_prefix" => nil,
        "test" => nil,
        "created_at" => nil,
        "request_body" => nil,
        "response_body" => nil
      }.freeze

      # The call's id, `req_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # The HTTP method of the call.
      # @return [String]
      def method
        read("method")
      end

      # The path that was called, with its query string.
      # @return [String, nil]
      def path
        read("path")
      end

      # Which operation the call reached, as `controller#action`.
      # @return [String]
      def endpoint
        read("endpoint")
      end

      # The HTTP status Listo answered with.
      # @return [Integer]
      def status
        read("status")
      end

      # The `error.code` of the answer when it was an error, otherwise null.
      # @return [String, nil]
      def error_code
        read("error_code")
      end

      # How long Listo took to answer, in milliseconds.
      # @return [Integer, nil]
      def duration_ms
        read("duration_ms")
      end

      # The call's request id, the value of the `X-Request-Id` response header.
      # @return [String, nil]
      def request_id
        read("request_id")
      end

      # The first characters of the key that made the call, never the secret.
      # @return [String, nil]
      def api_key_prefix
        read("api_key_prefix")
      end

      # True when the call was made with a test key.
      # @return [Boolean]
      def test
        read("test")
      end

      # When Listo received the call, ISO-8601 in UTC.
      # @return [String]
      def created_at
        read("created_at")
      end

      # What the call sent, as JSON.
      # @return [Object]
      def request_body
        read("request_body")
      end

      # What Listo answered, as JSON.
      # @return [Object]
      def response_body
        read("response_body")
      end
    end
  end
end
