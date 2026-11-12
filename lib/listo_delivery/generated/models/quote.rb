# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # A delivery priced and held for a short while.
    class Quote < Model
      TYPES = {
        "id" => nil,
        "fee_cents" => nil,
        "business_fee_cents" => nil,
        "customer_fee_cents" => nil,
        "cash_to_collect_cents" => nil,
        "currency" => nil,
        "pickup_duration_min" => nil,
        "dropoff_eta_at" => nil,
        "expires_at" => nil,
        "test" => nil,
        "created_at" => nil,
        "vehicle" => nil
      }.freeze

      # The quote id, `qt_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # The total delivery fee, in centavos, and the number a booking against this quote is held to.
      # @return [Integer]
      def fee_cents
        read("fee_cents")
      end

      # The part of the fee the store pays.
      # @return [Integer]
      def business_fee_cents
        read("business_fee_cents")
      end

      # The part of the fee the customer pays.
      # @return [Integer]
      def customer_fee_cents
        read("customer_fee_cents")
      end

      # What the courier collects at the door on a cash order: the order value plus the customer's share of the fee.
      # @return [Integer, nil]
      def cash_to_collect_cents
        read("cash_to_collect_cents")
      end

      # Always `MXN`; money is integer centavos.
      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # Minutes until a courier is expected at the store, when the quote came back with an estimate.
      # @return [Integer, nil]
      def pickup_duration_min
        read("pickup_duration_min")
      end

      # When the order is expected at the door, when the quote came back with an estimate.
      # @return [String, nil]
      def dropoff_eta_at
        read("dropoff_eta_at")
      end

      # The deadline for booking this price.
      # @return [String]
      def expires_at
        read("expires_at")
      end

      # Whether the quote belongs to the sandbox world.
      # @return [Boolean]
      def test
        read("test")
      end

      # @return [String]
      def created_at
        read("created_at")
      end

      # What this price was built for: `car` when you asked for one or an item was sized `xlarge`, `moto` otherwise.
      # One of: "moto", "car".
      # @return [String]
      def vehicle
        read("vehicle")
      end
    end
  end
end
