# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.44.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One movement on a balance.
    class LedgerEntry < Model
      TYPES = {
        "id" => nil,
        "type" => nil,
        "amount_cents" => nil,
        "delivery_id" => nil,
        "store_id" => nil,
        "test" => nil,
        "occurred_at" => nil
      }.freeze

      # The entry id, `le_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # Where the movement came from, such as `provider_charge`, `provider_charge_reversal`, `plan_charge` or `requote_adjustment`.
      # @return [String]
      def type
        read("type")
      end

      # Signed centavos.
      # @return [Integer]
      def amount_cents
        read("amount_cents")
      end

      # The `dlv_` id the movement stems from.
      # @return [String, nil]
      def delivery_id
        read("delivery_id")
      end

      # The `st_` id of the store the movement belongs to.
      # @return [String, nil]
      def store_id
        read("store_id")
      end

      # @return [Boolean]
      def test
        read("test")
      end

      # When the money moved.
      # @return [String]
      def occurred_at
        read("occurred_at")
      end
    end
  end
end
