# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.47.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    class DeliveryStatusChangedEvent < WebhookEvent
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => ["model", "Delivery"]
      }.freeze

      # @return [Models::Delivery]
      def data
        read("data")
      end
    end
  end
end
