# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.51.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    class OrderStatusChangedEvent < WebhookEvent
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => ["model", "OrderStatusChanged"]
      }.freeze

      # @return [Models::OrderStatusChanged]
      def data
        read("data")
      end
    end
  end
end
