# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.45.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Which event to send a sample of.
    class SendTestWebhookRequest < Model
      TYPES = {
        "type" => nil,
        "deliver" => nil
      }.freeze

      # The published event type to send a sample of.
      # One of: "delivery.status_changed", "delivery.updated", "delivery.courier_location", "withdrawal.updated", "store.updated", "store.connected", "delivery.message_skipped", "delivery.rated".
      # @return [String]
      def type
        read("type")
      end

      # Whether the event is also sent to your webhook URL.
      # @return [Boolean, nil]
      def deliver
        read("deliver")
      end
    end
  end
end
