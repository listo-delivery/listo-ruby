# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.42.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    class StoreConnectedEvent < WebhookEvent
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => ["model", "Store"]
      }.freeze

      # @return [Models::Store]
      def data
        read("data")
      end
    end
  end
end
