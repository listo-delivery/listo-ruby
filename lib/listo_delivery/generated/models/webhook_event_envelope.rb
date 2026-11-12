# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The fields every event shares.
    class WebhookEventEnvelope < Model
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil
      }.freeze

      # The event id, `evt_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # When the event was recorded, ISO-8601 in UTC.
      # @return [String]
      def created_at
        read("created_at")
      end

      # Present, and true, only on a test event you asked for with `POST /v1/test_webhooks`.
      # @return [Boolean, nil]
      def test
        read("test")
      end
    end
  end
end
