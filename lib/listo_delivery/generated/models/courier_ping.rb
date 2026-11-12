# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The reduced body of a `delivery.courier_location` event.
    class CourierPing < Model
      TYPES = {
        "delivery_id" => nil,
        "external_id" => nil,
        "location" => ["model", "CourierPing::Location"],
        "updated_at" => nil
      }.freeze

      # The `dlv_` id of the delivery the courier is carrying.
      # @return [String]
      def delivery_id
        read("delivery_id")
      end

      # Your own reference for that delivery, so you need not store ours.
      # @return [String, nil]
      def external_id
        read("external_id")
      end

      # @return [Models::CourierPing::Location]
      def location
        read("location")
      end

      # When this position was last confirmed, which is not the same as when the event was sent.
      # @return [String, nil]
      def updated_at
        read("updated_at")
      end

      class Location < Model
        TYPES = {
          "lat" => nil,
          "lng" => nil
        }.freeze

        # @return [Numeric]
        def lat
          read("lat")
        end

        # @return [Numeric]
        def lng
          read("lng")
        end
      end
    end
  end
end
