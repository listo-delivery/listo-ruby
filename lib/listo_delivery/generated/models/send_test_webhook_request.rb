# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.38.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Which event to send a sample of.
    class SendTestWebhookRequest < Model
      TYPES = {
        "type" => nil
      }.freeze

      # The published event type to send a sample of.
      # One of: "delivery.status_changed", "delivery.updated", "delivery.courier_location", "withdrawal.updated", "store.updated", "store.connected", "delivery.message_skipped".
      # @return [String]
      def type
        read("type")
      end
    end
  end
end
