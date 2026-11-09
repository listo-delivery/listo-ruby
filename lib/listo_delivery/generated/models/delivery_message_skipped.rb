# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.43.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The body of a `delivery.message_skipped` event.
    class DeliveryMessageSkipped < Model
      TYPES = {
        "delivery_id" => nil,
        "moment" => nil,
        "reason" => nil
      }.freeze

      # The `dlv_` id of the delivery whose message was not sent.
      # @return [String]
      def delivery_id
        read("delivery_id")
      end

      # Which message was skipped.
      # One of: "courier_assigned", "en_route", "arriving", "delivered", "not_delivered", "pickup_time_changed", "location_request", "payment_request", "dropoff_code".
      # @return [String]
      def moment
        read("moment")
      end

      # Why it was skipped.
      # One of: "not_a_team_phone", "daily_test_limit".
      # @return [String]
      def reason
        read("reason")
      end
    end
  end
end
