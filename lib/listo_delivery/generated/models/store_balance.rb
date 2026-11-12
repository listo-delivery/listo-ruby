# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One store's balance, for the store's own billing.
    class StoreBalance < Model
      TYPES = {
        "balance_cents" => nil,
        "available_cents" => nil,
        "currency" => nil,
        "billing" => nil,
        "in_review_cents" => nil
      }.freeze

      # @return [Integer]
      def balance_cents
        read("balance_cents")
      end

      # @return [Integer]
      def available_cents
        read("available_cents")
      end

      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # Whose balance pays this store's deliveries.
      # One of: "partner", "store".
      # @return [String]
      def billing
        read("billing")
      end

      # The part of `balance_cents` that is cash from an order we are still reviewing.
      # @return [Integer]
      def in_review_cents
        read("in_review_cents")
      end
    end
  end
end
