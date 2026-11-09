# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.45.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Why the order is being canceled.
    class CancelDeliveryRequest < Model
      TYPES = {
        "reason" => nil,
        "description" => nil
      }.freeze

      # Why the order is canceled.
      # One of: "customer_canceled", "store_closed", "item_unavailable", "wrong_address", "no_longer_needed", "other".
      # @return [String]
      def reason
        read("reason")
      end

      # A sentence of explanation.
      # @return [String, nil]
      def description
        read("description")
      end
    end
  end
end
