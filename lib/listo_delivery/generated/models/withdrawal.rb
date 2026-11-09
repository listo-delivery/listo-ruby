# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # A request to move money out of your balance to your bank account.
    class Withdrawal < Model
      TYPES = {
        "id" => nil,
        "amount_cents" => nil,
        "fee_cents" => nil,
        "currency" => nil,
        "kind" => nil,
        "status" => nil,
        "requested_at" => nil,
        "due_at" => nil,
        "resolved_at" => nil,
        "clave_de_rastreo" => nil,
        "test" => nil
      }.freeze

      # The withdrawal id, `wd_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # What your bank receives.
      # @return [Integer]
      def amount_cents
        read("amount_cents")
      end

      # What the withdrawal cost, IVA included.
      # @return [Integer]
      def fee_cents
        read("fee_cents")
      end

      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # `standard` is the free path: your released balance only, sent in 1 to 3 business days.
      # One of: "standard", "same_day".
      # @return [String]
      def kind
        read("kind")
      end

      # `pending` until a human settles it.
      # One of: "pending", "paid", "failed".
      # @return [String]
      def status
        read("status")
      end

      # @return [String, nil]
      def requested_at
        read("requested_at")
      end

      # When a `same_day` withdrawal is due to have been sent, stamped when you requested it and never recalculated afterwards.
      # @return [String, nil]
      def due_at
        read("due_at")
      end

      # Null while still pending.
      # @return [String, nil]
      def resolved_at
        read("resolved_at")
      end

      # The SPEI tracking key for the transfer: the identifier your own bank uses to locate the deposit.
      # @return [String, nil]
      def clave_de_rastreo
        read("clave_de_rastreo")
      end

      # @return [Boolean]
      def test
        read("test")
      end
    end
  end
end
