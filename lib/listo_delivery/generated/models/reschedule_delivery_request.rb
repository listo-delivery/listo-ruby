# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.43.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # What to change on an order.
    class RescheduleDeliveryRequest < Model
      TYPES = {
        "pickup_ready_at" => nil,
        "dropoff" => ["model", "RescheduleDeliveryRequest::Dropoff"]
      }.freeze

      # When the order will be ready: an ISO-8601 instant in UTC, or the literal `now` to dispatch it immediately.
      # @return [String, nil]
      def pickup_ready_at
        read("pickup_ready_at")
      end

      # The part of the drop-off that can still change.
      # @return [Models::RescheduleDeliveryRequest::Dropoff, nil]
      def dropoff
        read("dropoff")
      end

      # The part of the drop-off that can still change.
      class Dropoff < Model
        TYPES = {
          "notes" => nil
        }.freeze

        # Instructions for the courier at the door, up to 280 characters.
        # @return [String, nil]
        def notes
          read("notes")
        end
      end
    end
  end
end
