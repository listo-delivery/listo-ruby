# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.51.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The `data` of an `order.status_changed` event: the full order object, plus the status you were told before this one.
    class OrderStatusChanged < Model
      TYPES = {
        "id" => nil,
        "store_id" => nil,
        "code" => nil,
        "status" => nil,
        "test" => nil,
        "created_at" => nil,
        "fulfillment" => nil,
        "payment" => ["model", "OrderStatusChanged::Payment"],
        "lines" => ["array", ["model", "OrderStatusChanged::Line"]],
        "subtotal_cents" => nil,
        "offer_discount_cents" => nil,
        "food_cents" => nil,
        "customer_fee_cents" => nil,
        "total_cents" => nil,
        "currency" => nil,
        "customer" => ["model", "OrderStatusChanged::Customer"],
        "dropoff" => ["model", "OrderStatusChanged::Dropoff"],
        "requested_for" => nil,
        "ready_at" => nil,
        "rejection_reason" => nil,
        "rejection_note" => nil,
        "promotions" => ["array", nil],
        "delivery_id" => nil,
        "previous_status" => nil
      }.freeze

      # The order id, `ord_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # The `st_` id of the store that takes the order.
      # @return [String]
      def store_id
        read("store_id")
      end

      # The human order code the restaurant and the customer both quote.
      # @return [String]
      def code
        read("code")
      end

      # `pending_confirmation`: the restaurant has been asked and has not answered yet.
      # One of: "pending_confirmation", "preparing", "ready", "completed", "rejected", "canceled".
      # @return [String]
      def status
        read("status")
      end

      # True when the order was taken in test mode, and false for a live one.
      # @return [Boolean]
      def test
        read("test")
      end

      # When the customer placed the order.
      # @return [String]
      def created_at
        read("created_at")
      end

      # `delivery`: a courier brings it to the customer, and `dropoff` says where.
      # One of: "delivery", "pickup".
      # @return [String]
      def fulfillment
        read("fulfillment")
      end

      # How the customer pays, and where that got to.
      # @return [Models::OrderStatusChanged::Payment]
      def payment
        read("payment")
      end

      # What was ordered, in the order the customer gave it.
      # @return [Array<Models::OrderStatusChanged::Line>]
      def lines
        read("lines")
      end

      # The sum of the lines' `line_total_cents`, before any campaign offer.
      # @return [Integer]
      def subtotal_cents
        read("subtotal_cents")
      end

      # What a campaign offer took off the food in total: the sum of the lines' `offer_discount_cents`.
      # @return [Integer]
      def offer_discount_cents
        read("offer_discount_cents")
      end

      # The food the customer pays: `subtotal_cents` minus `offer_discount_cents`.
      # @return [Integer]
      def food_cents
        read("food_cents")
      end

      # What the customer pays for the delivery, already net of a delivery offer, so it can be 0 on a delivery order whose offer covered all of it.
      # @return [Integer]
      def customer_fee_cents
        read("customer_fee_cents")
      end

      # What the customer pays in all: `food_cents` plus `customer_fee_cents`.
      # @return [Integer]
      def total_cents
        read("total_cents")
      end

      # Always `MXN`; every amount is in centavos of it.
      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # Who placed the order.
      # @return [Models::OrderStatusChanged::Customer]
      def customer
        read("customer")
      end

      # Where the order goes, on a delivery order.
      # @return [Models::OrderStatusChanged::Dropoff, nil]
      def dropoff
        read("dropoff")
      end

      # The time the customer asked for the order.
      # @return [String, nil]
      def requested_for
        read("requested_for")
      end

      # The time the restaurant promised the order ready.
      # @return [String, nil]
      def ready_at
        read("ready_at")
      end

      # Why the restaurant did not accept the order, on a `rejected` order and null otherwise.
      # One of: "out_of_stock", "saturated", "closed", "other", "unanswered", nil.
      # @return [String, nil]
      def rejection_reason
        read("rejection_reason")
      end

      # The restaurant's own words, only when `rejection_reason` is `other`.
      # @return [String, nil]
      def rejection_note
        read("rejection_note")
      end

      # The promotions the restaurant was running when the order arrived and that the order qualifies for, as the owner wrote them (a gift such as...
      # @return [Array<String>]
      def promotions
        read("promotions")
      end

      # The `dlv_` id of the order's delivery, once the restaurant accepted a delivery order and a courier was requested for it.
      # @return [String, nil]
      def delivery_id
        read("delivery_id")
      end

      # The last status you were told for this order, which is not always the status it had a moment ago: when two moves arrive as one event, this...
      # One of: "pending_confirmation", "preparing", "ready", "completed", "rejected", "canceled", nil.
      # @return [String, nil]
      def previous_status
        read("previous_status")
      end

      # How the customer pays, and where that got to.
      class Payment < Model
        TYPES = {
          "method" => nil,
          "status" => nil,
          "paid_at" => nil
        }.freeze

        # `cash` is paid at the door or at the counter.
        # One of: "cash", "card".
        # @return [String]
        def method
          read("method")
        end

        # A cash order stays `unpaid`: the money is collected by hand and is not tracked here.
        # One of: "unpaid", "awaiting_payment", "paid", "partially_refunded", "refunded".
        # @return [String]
        def status
          read("status")
        end

        # When the card payment landed.
        # @return [String, nil]
        def paid_at
          read("paid_at")
        end
      end

      class Line < Model
        TYPES = {
          "name" => nil,
          "quantity" => nil,
          "options" => ["array", nil],
          "note" => nil,
          "unit_price_cents" => nil,
          "sale_discount_cents" => nil,
          "line_total_cents" => nil,
          "offer_discount_cents" => nil
        }.freeze

        # The dish's name as it was when the order was placed.
        # @return [String]
        def name
          read("name")
        end

        # @return [Integer]
        def quantity
          read("quantity")
        end

        # What the customer chose on the dish, one string per question, with the answers given inside an option in parentheses, as the restaurant's...
        # @return [Array<String>]
        def options
          read("options")
        end

        # What the customer asked for on this line, in their words.
        # @return [String, nil]
        def note
          read("note")
        end

        # The price of ONE unit, with the options included and any sale already applied.
        # @return [Integer]
        def unit_price_cents
          read("unit_price_cents")
        end

        # What a sale took off ONE unit, already inside `unit_price_cents`: the unit's regular price is the sum of the two.
        # @return [Integer]
        def sale_discount_cents
          read("sale_discount_cents")
        end

        # The whole line, `unit_price_cents` times `quantity`, BEFORE any campaign offer.
        # @return [Integer]
        def line_total_cents
          read("line_total_cents")
        end

        # What a campaign offer took off the WHOLE line (not per unit), not included in `line_total_cents`.
        # @return [Integer]
        def offer_discount_cents
          read("offer_discount_cents")
        end
      end

      # Who placed the order.
      class Customer < Model
        TYPES = {
          "name" => nil,
          "phone" => nil
        }.freeze

        # @return [String]
        def name
          read("name")
        end

        # E.164.
        # @return [String]
        def phone
          read("phone")
        end
      end

      # Where the order goes, on a delivery order.
      class Dropoff < Model
        TYPES = {
          "name" => nil,
          "phone" => nil,
          "street" => nil,
          "apt_unit" => nil,
          "lat" => nil,
          "lng" => nil,
          "notes" => nil,
          "handoff" => nil
        }.freeze

        # @return [String]
        def name
          read("name")
        end

        # E.164.
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

        # Null when the address was never located on the map.
        # @return [Numeric, nil]
        def lat
          read("lat")
        end

        # @return [Numeric, nil]
        def lng
          read("lng")
        end

        # What the customer wrote for the courier.
        # @return [String, nil]
        def notes
          read("notes")
        end

        # One of: "meet_at_door", "leave_at_door", "meet_outside".
        # @return [String]
        def handoff
          read("handoff")
        end
      end
    end
  end
end
