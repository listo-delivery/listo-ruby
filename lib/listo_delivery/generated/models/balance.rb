# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.40.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Your prepaid balance for the world the key acts in.
    class Balance < Model
      TYPES = {
        "balance_cents" => nil,
        "available_cents" => nil,
        "currency" => nil,
        "same_day" => ["model", "SameDayTerms"],
        "in_review_cents" => nil
      }.freeze

      # Everything in the account, in centavos.
      # @return [Integer]
      def balance_cents
        read("balance_cents")
      end

      # What you can withdraw today.
      # @return [Integer]
      def available_cents
        read("available_cents")
      end

      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # @return [Models::SameDayTerms]
      def same_day
        read("same_day")
      end

      # The part of `balance_cents` that is cash from an order we are still reviewing.
      # @return [Integer]
      def in_review_cents
        read("in_review_cents")
      end
    end
  end
end
