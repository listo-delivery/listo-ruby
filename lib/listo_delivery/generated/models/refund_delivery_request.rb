# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.42.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # How much of the order to refund.
    class RefundDeliveryRequest < Model
      TYPES = {
        "amount_cents" => nil,
        "reason" => nil
      }.freeze

      # A smaller amount than the whole, in centavos.
      # @return [Integer, nil]
      def amount_cents
        read("amount_cents")
      end

      # Why the refund is being made, up to 500 characters.
      # @return [String, nil]
      def reason
        read("reason")
      end
    end
  end
end
