# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The trip to price.
    class CreateQuoteRequest < Model
      TYPES = {
        "store_id" => nil,
        "dropoff" => ["model", "CreateQuoteRequest::Dropoff"],
        "payment_method" => nil,
        "order_value_cents" => nil,
        "business_fee_share" => nil,
        "business_fee_cap_cents" => nil,
        "pickup_ready_at" => nil,
        "vehicle" => nil,
        "manifest" => ["model", "Manifest"]
      }.freeze

      # The `st_` id of the store the courier collects from.
      # @return [String]
      def store_id
        read("store_id")
      end

      # Where the order goes.
      # @return [Models::CreateQuoteRequest::Dropoff]
      def dropoff
        read("dropoff")
      end

      # How the customer pays.
      # One of: "prepaid", "cash", "card".
      # @return [String, nil]
      def payment_method
        read("payment_method")
      end

      # The value of the order, in centavos.
      # @return [Integer, nil]
      def order_value_cents
        read("order_value_cents")
      end

      # The percent of the delivery fee the store pays.
      # @return [Integer, nil]
      def business_fee_share
        read("business_fee_share")
      end

      # The most the store pays toward the fee, in centavos.
      # @return [Integer, nil]
      def business_fee_cap_cents
        read("business_fee_cap_cents")
      end

      # When the order will be ready, ISO-8601 in UTC.
      # @return [String, nil]
      def pickup_ready_at
        read("pickup_ready_at")
      end

      # Defaults to `moto`.
      # One of: "moto", "car".
      # @return [String, nil]
      def vehicle
        read("vehicle")
      end

      # @return [Models::Manifest, nil]
      def manifest
        read("manifest")
      end

      # Where the order goes.
      class Dropoff < Model
        TYPES = {
          "street" => nil,
          "apt_unit" => nil,
          "lat" => nil,
          "lng" => nil
        }.freeze

        # The full street address, in one string.
        # @return [String]
        def street
          read("street")
        end

        # @return [String, nil]
        def apt_unit
          read("apt_unit")
        end

        # Latitude.
        # @return [Numeric, nil]
        def lat
          read("lat")
        end

        # Longitude.
        # @return [Numeric, nil]
        def lng
          read("lng")
        end
      end
    end
  end
end
