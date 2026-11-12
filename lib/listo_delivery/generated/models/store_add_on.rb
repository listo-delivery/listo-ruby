# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One paid add-on of a store and where it stands.
    class StoreAddOn < Model
      TYPES = {
        "status" => nil,
        "price_cents" => nil,
        "charged" => nil,
        "renews_on" => nil,
        "ends_on" => nil,
        "available" => nil
      }.freeze

      # `off` is not switched on.
      # One of: "off", "on", "ending", "scheduled", "past_due".
      # @return [String]
      def status
        read("status")
      end

      # What the add-on costs, in cents before IVA: per month for a `monthly` add-on and per use for the other two.
      # @return [Integer]
      def price_cents
        read("price_cents")
      end

      # How it is charged.
      # One of: "per_delivered_trip", "monthly", "per_paid_payment".
      # @return [String]
      def charged
        read("charged")
      end

      # The day a monthly add-on is charged next.
      # @return [String, nil]
      def renews_on
        read("renews_on")
      end

      # The last day an `ending` add-on is on.
      # @return [String, nil]
      def ends_on
        read("ends_on")
      end

      # Whether this add-on can be switched on for the store.
      # @return [Boolean]
      def available
        read("available")
      end
    end
  end
end
