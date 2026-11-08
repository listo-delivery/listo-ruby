# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.37.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    class DeliveryCourierLocationEvent < WebhookEvent
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => ["model", "CourierPing"]
      }.freeze

      # @return [Models::CourierPing]
      def data
        read("data")
      end
    end
  end
end
