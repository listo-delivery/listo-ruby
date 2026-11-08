# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.37.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The order to dispatch.
    class CreateDeliveryRequest < Model
      TYPES = {
        "store_id" => nil,
        "quote_id" => nil,
        "external_id" => nil,
        "payment_method" => nil,
        "order_value_cents" => nil,
        "business_fee_share" => nil,
        "business_fee_cap_cents" => nil,
        "tip_cents" => nil,
        "dropoff" => ["model", "CreateDeliveryRequest::Dropoff"],
        "handoff" => nil,
        "manifest" => ["model", "Manifest"],
        "verification" => ["model", "CreateDeliveryRequest::Verification"],
        "pickup_ready_at" => nil,
        "vehicle" => nil,
        "simulate" => nil
      }.freeze

      # The `st_` id of the store the courier collects from.
      # @return [String]
      def store_id
        read("store_id")
      end

      # The `qt_` id of a quote to book at exactly its price.
      # @return [String, nil]
      def quote_id
        read("quote_id")
      end

      # Your own reference for this order.
      # @return [String]
      def external_id
        read("external_id")
      end

      # How the customer pays.
      # One of: "prepaid", "cash", "card".
      # @return [String]
      def payment_method
        read("payment_method")
      end

      # The value of the order, in centavos.
      # @return [Integer]
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

      # A tip for the courier, in centavos, up to 100000.
      # @return [Integer, nil]
      def tip_cents
        read("tip_cents")
      end

      # Where the order goes, and who receives it.
      # @return [Models::CreateDeliveryRequest::Dropoff]
      def dropoff
        read("dropoff")
      end

      # Where the courier hands the order over.
      # One of: "meet_at_door", "leave_at_door", "meet_outside".
      # @return [String, nil]
      def handoff
        read("handoff")
      end

      # @return [Models::Manifest, nil]
      def manifest
        read("manifest")
      end

      # Proof the customer must give the courier.
      # @return [Models::CreateDeliveryRequest::Verification, nil]
      def verification
        read("verification")
      end

      # When the order will be ready, ISO-8601 in UTC, between 10 minutes and 29 days from now.
      # @return [String, nil]
      def pickup_ready_at
        read("pickup_ready_at")
      end

      # Defaults to `moto`, or to the quote's when you book one.
      # One of: "moto", "car".
      # @return [String, nil]
      def vehicle
        read("vehicle")
      end

      # Test keys only: the scenario the simulated courier plays.
      # One of: "returned", "no_courier", "delayed_pickup", "courier_reassigned".
      # @return [String, nil]
      def simulate
        read("simulate")
      end

      # Where the order goes, and who receives it.
      class Dropoff < Model
        TYPES = {
          "name" => nil,
          "phone" => nil,
          "street" => nil,
          "apt_unit" => nil,
          "lat" => nil,
          "lng" => nil,
          "notes" => nil
        }.freeze

        # Who receives the order.
        # @return [String]
        def name
          read("name")
        end

        # A phone the courier can call, any format that resolves to an E.164 number.
        # @return [String]
        def phone
          read("phone")
        end

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

        # Instructions for the courier at the door, up to 280 characters.
        # @return [String, nil]
        def notes
          read("notes")
        end
      end

      # Proof the customer must give the courier.
      class Verification < Model
        TYPES = {
          "dropoff_pincode" => nil
        }.freeze

        # True to require a code at the door.
        # @return [Boolean, nil]
        def dropoff_pincode
          read("dropoff_pincode")
        end
      end
    end
  end
end
