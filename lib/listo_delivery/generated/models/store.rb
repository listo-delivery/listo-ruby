# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.44.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # A pickup location.
    class Store < Model
      TYPES = {
        "id" => nil,
        "external_id" => nil,
        "name" => nil,
        "phone" => nil,
        "street" => nil,
        "apt_unit" => nil,
        "lat" => nil,
        "lng" => nil,
        "pickup_notes" => nil,
        "timezone" => nil,
        "default_business_fee_share" => nil,
        "default_fee_split_mode" => nil,
        "default_fee_split_amount_cents" => nil,
        "access_tier" => nil,
        "markup_cents" => nil,
        "billing" => nil,
        "test" => nil,
        "created_at" => nil,
        "plan" => ["model", "Store::Plan"],
        "add_ons" => ["model", "Store::AddOns"],
        "order_value_limits" => ["model", "Store::OrderValueLimits"]
      }.freeze

      # The store id, `st_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # Your own reference for this location, if you sent one.
      # @return [String, nil]
      def external_id
        read("external_id")
      end

      # The name you gave the store; for a restaurant that connected an account with several branches, the business and the branch, the way its own...
      # @return [String]
      def name
        read("name")
      end

      # E.164, normalized on the way in.
      # @return [String]
      def phone
        read("phone")
      end

      # @return [String]
      def street
        read("street")
      end

      # @return [String, nil]
      def apt_unit
        read("apt_unit")
      end

      # @return [Numeric, nil]
      def lat
        read("lat")
      end

      # @return [Numeric, nil]
      def lng
        read("lng")
      end

      # Standing instructions for the courier collecting here.
      # @return [String, nil]
      def pickup_notes
        read("pickup_notes")
      end

      # The IANA zone the store keeps its hours in, normalized to one spelling per zone.
      # @return [String]
      def timezone
        read("timezone")
      end

      # The share of the delivery fee this store covers by default, as a percentage.
      # @return [Integer]
      def default_business_fee_share
        read("default_business_fee_share")
      end

      # Which shape this store's default split has, and therefore which of the two fields above and below is in force.
      # One of: "percent", "business_amount", "customer_amount".
      # @return [String]
      def default_fee_split_mode
        read("default_fee_split_mode")
      end

      # The amount the two amount modes divide the fee by, in cents.
      # @return [Integer, nil]
      def default_fee_split_amount_cents
        read("default_fee_split_amount_cents")
      end

      # How much of Listo the store itself uses.
      # One of: "api_only", "wallet", "full".
      # @return [String]
      def access_tier
        read("access_tier")
      end

      # Your own markup on every delivery of this store, in cents.
      # @return [Integer]
      def markup_cents
        read("markup_cents")
      end

      # Whose balance pays this store's deliveries, read off `access_tier` so you never have to derive it: `partner` is yours, `store` is the...
      # One of: "partner", "store".
      # @return [String]
      def billing
        read("billing")
      end

      # @return [Boolean]
      def test
        read("test")
      end

      # @return [String]
      def created_at
        read("created_at")
      end

      # The store's Plan Listo, or `null` when the store needs no plan: a test store, or a live store created before Plan Listo existed, which...
      # @return [Models::Store::Plan, nil]
      def plan
        read("plan")
      end

      # The store's paid add-ons, or `null` when the store cannot hold any.
      # @return [Models::Store::AddOns, nil]
      def add_ons
        read("add_ons")
      end

      # The most an order may be worth at this store right now, per payment type.
      # @return [Models::Store::OrderValueLimits]
      def order_value_limits
        read("order_value_limits")
      end

      # The store's Plan Listo, or `null` when the store needs no plan: a test store, or a live store created before Plan Listo existed, which...
      class Plan < Model
        TYPES = {
          "status" => nil,
          "price_cents" => nil,
          "currency" => nil,
          "interval" => nil,
          "current_period_ends_on" => nil,
          "next_charge_on" => nil,
          "canceled_at" => nil,
          "ends_on" => nil,
          "paid_by" => nil,
          "pending_paid_by" => nil,
          "pending_paid_by_on" => nil,
          "courtesy" => nil
        }.freeze

        # `active` is paid up and renews on `next_charge_on` (null on a plan that is passing to the restaurant, see `pending_paid_by`).
        # One of: "active", "past_due", "canceling", "canceled", "awaiting_payment".
        # @return [String]
        def status
          read("status")
        end

        # What one month of this store's plan costs you, before IVA: your price, even while a restaurant that connected to you is still paying its...
        # @return [Integer]
        def price_cents
          read("price_cents")
        end

        # @return [String]
        def currency
          read("currency")
        end

        # How long one period of this plan is, and the cycle `price_cents` is the price of.
        # @return [String]
        def interval
          read("interval")
        end

        # The last day of the current period, already paid unless `status` is `past_due`.
        # @return [String, nil]
        def current_period_ends_on
          read("current_period_ends_on")
        end

        # The day you are charged next: the next renewal, or, while a restaurant that connected to you still pays its own plan, your first charge.
        # @return [String, nil]
        def next_charge_on
          read("next_charge_on")
        end

        # When you canceled the plan.
        # @return [String, nil]
        def canceled_at
          read("canceled_at")
        end

        # The day the plan stops serving the store, which is the day after the last day paid, or the day a plan whose charge was pending was canceled.
        # @return [String, nil]
        def ends_on
          read("ends_on")
        end

        # Who pays this plan: `partner`, which is you, or `store`, the restaurant itself.
        # One of: "partner", "store".
        # @return [String]
        def paid_by
          read("paid_by")
        end

        # Who will pay it from `pending_paid_by_on`, when that is about to change, or null.
        # @return [String, nil]
        def pending_paid_by
          read("pending_paid_by")
        end

        # The date that change lands (the day the new payer's first period starts), or null.
        # @return [String, nil]
        def pending_paid_by_on
          read("pending_paid_by_on")
        end

        # `courtesy` is true while Listo waives this store's plan: nothing is charged and `next_charge_on` is null.
        # @return [Boolean]
        def courtesy
          read("courtesy")
        end
      end

      # The store's paid add-ons, or `null` when the store cannot hold any.
      class AddOns < Model
        TYPES = {
          "customer_whatsapp" => ["model", "StoreAddOn"],
          "ratings" => ["model", "StoreAddOn"],
          "card_payments" => ["model", "StoreAddOn"],
          "wallet" => ["model", "StoreAddOn"],
          "full_console" => ["model", "StoreAddOn"]
        }.freeze

        # @return [Models::StoreAddOn]
        def customer_whatsapp
          read("customer_whatsapp")
        end

        # @return [Models::StoreAddOn]
        def ratings
          read("ratings")
        end

        # @return [Models::StoreAddOn]
        def card_payments
          read("card_payments")
        end

        # @return [Models::StoreAddOn]
        def wallet
          read("wallet")
        end

        # @return [Models::StoreAddOn]
        def full_console
          read("full_console")
        end
      end

      # The most an order may be worth at this store right now, per payment type.
      class OrderValueLimits < Model
        TYPES = {
          "prepaid_max_cents" => nil,
          "card_max_cents" => nil,
          "cash_max_cents" => nil
        }.freeze

        # The most an order you record as already paid (`prepaid`) may be worth at this store, in cents.
        # @return [Integer]
        def prepaid_max_cents
          read("prepaid_max_cents")
        end

        # The most the food of an order paid by card link may be worth at this store, in cents.
        # @return [Integer]
        def card_max_cents
          read("card_max_cents")
        end

        # The most the courier may collect in cash at this store (the order value plus the customer's share of the fee), in cents.
        # @return [Integer]
        def cash_max_cents
          read("cash_max_cents")
        end
      end
    end
  end
end
