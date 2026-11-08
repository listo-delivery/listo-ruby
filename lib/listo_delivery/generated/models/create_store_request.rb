# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.37.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The pickup location to create.
    class CreateStoreRequest < Model
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
        "owner_email" => nil
      }.freeze

      # @return [String]
      def name
        read("name")
      end

      # A phone that resolves to an E.164 number.
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

      # The percent of the delivery fee the store pays by default.
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

      # Your markup on each delivery, in centavos, up to 1000000.
      # @return [Integer, nil]
      def markup_cents
        read("markup_cents")
      end

      # Your own reference for this location.
      # @return [String, nil]
      def external_id
        read("external_id")
      end

      # The restaurant owner to invite, for a store with a console.
      # @return [String, nil]
      def owner_email
        read("owner_email")
      end
    end
  end
end
