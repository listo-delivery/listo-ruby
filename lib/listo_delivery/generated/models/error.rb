# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # What every refusal and every failure looks like.
    class Error < Model
      TYPES = {
        "code" => nil,
        "message" => nil,
        "param" => nil,
        "retryable" => nil,
        "doc_url" => nil,
        "request_id" => nil
      }.freeze

      # A stable, machine-readable name for what went wrong, such as `validation_failed`, `not_found` or `insufficient_balance`.
      # @return [String]
      def code
        read("code")
      end

      # A sentence for the person debugging.
      # @return [String]
      def message
        read("message")
      end

      # The request field the refusal is about, when one applies, spelled as you sent it (`dropoff.street`, `manifest.items`).
      # @return [String, nil]
      def param
        read("param")
      end

      # Whether sending the identical request again could succeed.
      # @return [Boolean]
      def retryable
        read("retryable")
      end

      # The documentation page for this `code`.
      # @return [String]
      def doc_url
        read("doc_url")
      end

      # Our id for this request, the same value as the `X-Request-Id` response header.
      # @return [String]
      def request_id
        read("request_id")
      end
    end
  end
end
