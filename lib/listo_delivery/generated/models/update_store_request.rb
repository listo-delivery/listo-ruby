# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.39.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The fields to change.
    class UpdateStoreRequest < Model
      TYPES = {
        "name" => nil,
        "phone" => nil,
        "street" => nil,
        "apt_unit" => nil,
        "lat" => nil,
        "lng" => nil,
        "pickup_notes" => nil,
        "timezone" => nil,
        "default_business_fee_share" => nil,
        "access_tier" => nil,
        "markup_cents" => nil,
        "external_id" => nil,
        "add_ons" => ["model", "UpdateStoreRequest::AddOns"]
      }.freeze

      # @return [String, nil]
      def name
        read("name")
      end

      # A phone that resolves to an E.164 number.
      # @return [String, nil]
      def phone
        read("phone")
      end

      # The full street address, in one string.
      # @return [String, nil]
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

      # Instructions for the courier at the store, up to 280 characters.
      # @return [String, nil]
      def pickup_notes
        read("pickup_notes")
      end

      # An IANA time zone name.
      # @return [String, nil]
      def timezone
        read("timezone")
      end

      # @return [Integer, nil]
      def default_business_fee_share
        read("default_business_fee_share")
      end

      # What the store gets besides the API.
      # One of: "api_only", "wallet", "full".
      # @return [String, nil]
      def access_tier
        read("access_tier")
      end

      # @return [Integer, nil]
      def markup_cents
        read("markup_cents")
      end

      # Your own reference for this location.
      # @return [String, nil]
      def external_id
        read("external_id")
      end

      # Add-ons to switch on (`true`) or off (`false`).
      # @return [Models::UpdateStoreRequest::AddOns, nil]
      def add_ons
        read("add_ons")
      end

      # Add-ons to switch on (`true`) or off (`false`).
      class AddOns < Model
        TYPES = {
          "customer_whatsapp" => nil,
          "ratings" => nil,
          "card_payments" => nil,
          "wallet" => nil,
          "full_console" => nil
        }.freeze

        # @return [Boolean, nil]
        def customer_whatsapp
          read("customer_whatsapp")
        end

        # @return [Boolean, nil]
        def ratings
          read("ratings")
        end

        # @return [Boolean, nil]
        def card_payments
          read("card_payments")
        end

        # @return [Boolean, nil]
        def wallet
          read("wallet")
        end

        # @return [Boolean, nil]
        def full_console
          read("full_console")
        end
      end
    end
  end
end
