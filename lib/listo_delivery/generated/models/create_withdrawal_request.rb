# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.37.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # How much to move out of your balance.
    class CreateWithdrawalRequest < Model
      TYPES = {
        "amount_cents" => nil,
        "kind" => nil
      }.freeze

      # What your bank receives, in centavos.
      # @return [Integer]
      def amount_cents
        read("amount_cents")
      end

      # Defaults to `standard`.
      # One of: "standard", "same_day", nil.
      # @return [String, nil]
      def kind
        read("kind")
      end
    end
  end
end
