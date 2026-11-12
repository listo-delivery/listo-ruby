# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The shape of a delivery: every field the object can carry, with the nullability each one really has.
    class Delivery < Model
      TYPES = {
        "id" => nil,
        "external_id" => nil,
        "origin" => nil,
        "code" => nil,
        "status" => nil,
        "store_id" => nil,
        "test" => nil,
        "payment" => ["model", "Delivery::Payment"],
        "order_value_cents" => nil,
        "fee_cents" => nil,
        "business_fee_cents" => nil,
        "customer_fee_cents" => nil,
        "tip_cents" => nil,
        "currency" => nil,
        "quote_id" => nil,
        "pickup" => ["model", "Delivery::Pickup"],
        "dropoff" => ["model", "Delivery::Dropoff"],
        "manifest" => ["model", "Delivery::Manifest"],
        "vehicle" => nil,
        "courier" => ["model", "Delivery::Courier"],
        "pickup_eta_at" => nil,
        "dropoff_eta_at" => nil,
        "tracking_url" => nil,
        "verification" => ["model", "Delivery::Verification"],
        "return_verification" => ["model", "Delivery::ReturnVerification"],
        "proof" => ["model", "Delivery::Proof"],
        "proofs" => ["model", "Delivery::Proofs"],
        "rating" => ["model", "Delivery::Rating"],
        "cancellation" => ["model", "Delivery::Cancellation"],
        "failure_reason" => nil,
        "charges" => ["array", ["model", "Delivery::Charge"]],
        "refunds" => ["array", ["model", "Delivery::Refund"]],
        "refunded_cents" => nil,
        "refundable_cents" => nil,
        "support_reference" => nil,
        "pickup_ready_at" => nil,
        "requested_at" => nil,
        "courier_assigned_at" => nil,
        "picked_up_at" => nil,
        "delivered_at" => nil,
        "canceled_at" => nil,
        "returned_at" => nil,
        "created_at" => nil,
        "updated_at" => nil
      }.freeze

      # The delivery id, `dlv_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # Your own order reference, echoed back exactly as you sent it.
      # @return [String, nil]
      def external_id
        read("external_id")
      end

      # Which lane created the delivery.
      # One of: "api", "console", "whatsapp".
      # @return [String]
      def origin
        read("origin")
      end

      # The human order code the courier and our support quote.
      # @return [String]
      def code
        read("code")
      end

      # `delivered`, `returned` and `canceled` are terminal.
      # @return [String]
      def status
        read("status")
      end

      # The `st_` id of the store the courier collects from.
      # @return [String]
      def store_id
        read("store_id")
      end

      # Whether this order lives in the sandbox.
      # @return [Boolean]
      def test
        read("test")
      end

      # How the customer pays, and where that got to.
      # @return [Models::Delivery::Payment]
      def payment
        read("payment")
      end

      # The goods value you sent, untouched.
      # @return [Integer]
      def order_value_cents
        read("order_value_cents")
      end

      # The total delivery fee.
      # @return [Integer]
      def fee_cents
        read("fee_cents")
      end

      # The part of `fee_cents` charged to you.
      # @return [Integer]
      def business_fee_cents
        read("business_fee_cents")
      end

      # The part of `fee_cents` charged to the customer.
      # @return [Integer]
      def customer_fee_cents
        read("customer_fee_cents")
      end

      # The courier tip you sent on this delivery, paid to the courier and passed on at cost with no margin taken.
      # @return [Integer]
      def tip_cents
        read("tip_cents")
      end

      # One of: "MXN".
      # @return [String]
      def currency
        read("currency")
      end

      # The `qt_` quote this order bound, so you can tie the price you were quoted to the order that spent it.
      # @return [String, nil]
      def quote_id
        read("quote_id")
      end

      # Where the courier collects, snapshotted at create, so a historical order keeps reporting where the courier actually went even after the...
      # @return [Models::Delivery::Pickup]
      def pickup
        read("pickup")
      end

      # Where the courier delivers, echoed back as you sent it.
      # @return [Models::Delivery::Dropoff]
      def dropoff
        read("dropoff")
      end

      # The descriptive item list you sent, for the courier.
      # @return [Models::Delivery::Manifest, nil]
      def manifest
        read("manifest")
      end

      # What the trip was priced and dispatched as: `car` when you asked for one or when an item was sized `xlarge`, `moto` otherwise.
      # One of: "moto", "car".
      # @return [String]
      def vehicle
        read("vehicle")
      end

      # Null until a courier is assigned, and then FROZEN: a terminal delivery keeps reporting who carried it.
      # @return [Models::Delivery::Courier, nil]
      def courier
        read("courier")
      end

      # When the courier is expected at the store.
      # @return [String, nil]
      def pickup_eta_at
        read("pickup_eta_at")
      end

      # When the courier is expected at the customer.
      # @return [String, nil]
      def dropoff_eta_at
        read("dropoff_eta_at")
      end

      # The branded live tracking page for the customer: the map, the courier, the delivery code and what is owed at the door.
      # @return [String, nil]
      def tracking_url
        read("tracking_url")
      end

      # Present only when the order carries a dropoff PIN: when you asked for one (`verification.dropoff_pincode` on the create), or when Listo...
      # @return [Models::Delivery::Verification, nil]
      def verification
        read("verification")
      end

      # The return code (código de devolución).
      # @return [Models::Delivery::ReturnVerification]
      def return_verification
        read("return_verification")
      end

      # Proof of delivery.
      # @return [Models::Delivery::Proof, nil]
      def proof
        read("proof")
      end

      # The evidence the trip left, one entry per moment.
      # @return [Models::Delivery::Proofs]
      def proofs
        read("proofs")
      end

      # What the customer rated the FOOD, for a store with the `ratings` add-on.
      # @return [Models::Delivery::Rating, nil]
      def rating
        read("rating")
      end

      # Who called the order off, and why.
      # @return [Models::Delivery::Cancellation, nil]
      def cancellation
        read("cancellation")
      end

      # Why a dispatch failed, bucketed by whose side the problem is on, so you can act on it rather than just retry blindly.
      # One of: "no_couriers_available", "address_unreachable", "customer_unavailable", "delivery_failed", nil.
      # @return [String, nil]
      def failure_reason
        read("failure_reason")
      end

      # What a trip that was driven but wasted was billed at: the delivery fee for each leg driven, less your own store markup.
      # @return [Array<Models::Delivery::Charge>]
      def charges
        read("charges")
      end

      # Every time money went back to the customer on this order, newest first.
      # @return [Array<Models::Delivery::Refund>]
      def refunds
        read("refunds")
      end

      # The sum of the SUCCEEDED refunds above, in Mexican peso cents.
      # @return [Integer]
      def refunded_cents
        read("refunded_cents")
      end

      # What a further refund could still return: what the customer paid (`order_value_cents` plus `customer_fee_cents`, which IS the charge) minus...
      # @return [Integer]
      def refundable_cents
        read("refundable_cents")
      end

      # A short handle to quote when you escalate an order to us.
      # @return [String, nil]
      def support_reference
        read("support_reference")
      end

      # The scheduled pickup time you asked for.
      # @return [String, nil]
      def pickup_ready_at
        read("pickup_ready_at")
      end

      # @return [String, nil]
      def requested_at
        read("requested_at")
      end

      # When a courier was first observed on the current attempt.
      # @return [String, nil]
      def courier_assigned_at
        read("courier_assigned_at")
      end

      # @return [String, nil]
      def picked_up_at
        read("picked_up_at")
      end

      # @return [String, nil]
      def delivered_at
        read("delivered_at")
      end

      # @return [String, nil]
      def canceled_at
        read("canceled_at")
      end

      # @return [String, nil]
      def returned_at
        read("returned_at")
      end

      # @return [String]
      def created_at
        read("created_at")
      end

      # @return [String]
      def updated_at
        read("updated_at")
      end

      # How the customer pays, and where that got to.
      class Payment < Model
        TYPES = {
          "method" => nil,
          "status" => nil,
          "url" => nil,
          "cash_to_collect_cents" => nil,
          "paid_at" => nil
        }.freeze

        # One of: "prepaid", "cash", "card".
        # @return [String]
        def method
          read("method")
        end

        # One of: "unpaid", "awaiting_payment", "paid", "partially_refunded", "refunded".
        # @return [String]
        def status
          read("status")
        end

        # The branded payment link for a card order still awaiting payment.
        # @return [String, nil]
        def url
          read("url")
        end

        # What the courier collects at the door: the goods value plus the customer's share of the fee.
        # @return [Integer, nil]
        def cash_to_collect_cents
          read("cash_to_collect_cents")
        end

        # @return [String, nil]
        def paid_at
          read("paid_at")
        end
      end

      # Where the courier collects, snapshotted at create, so a historical order keeps reporting where the courier actually went even after the...
      class Pickup < Model
        TYPES = {
          "name" => nil,
          "street" => nil,
          "lat" => nil,
          "lng" => nil,
          "notes" => nil
        }.freeze

        # @return [String]
        def name
          read("name")
        end

        # @return [String]
        def street
          read("street")
        end

        # @return [Numeric, nil]
        def lat
          read("lat")
        end

        # @return [Numeric, nil]
        def lng
          read("lng")
        end

        # The store's standing pickup instructions, not a per-order value.
        # @return [String, nil]
        def notes
          read("notes")
        end
      end

      # Where the courier delivers, echoed back as you sent it.
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

        # Null when the address was never geocoded and the text was judged instead.
        # @return [Numeric, nil]
        def lat
          read("lat")
        end

        # @return [Numeric, nil]
        def lng
          read("lng")
        end

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

      # The descriptive item list you sent, for the courier.
      class Manifest < Model
        TYPES = {
          "items" => ["array", ["model", "Delivery::Manifest::Item"]]
        }.freeze

        # @return [Array<Models::Delivery::Manifest::Item>]
        def items
          read("items")
        end

        class Item < Model
          TYPES = {
            "name" => nil,
            "quantity" => nil,
            "size" => nil
          }.freeze

          # @return [String]
          def name
            read("name")
          end

          # @return [Integer]
          def quantity
            read("quantity")
          end

          # What the item was sent as.
          # One of: "small", "medium", "large", "xlarge".
          # @return [String]
          def size
            read("size")
          end
        end
      end

      # Null until a courier is assigned, and then FROZEN: a terminal delivery keeps reporting who carried it.
      class Courier < Model
        TYPES = {
          "name" => nil,
          "vehicle" => nil,
          "vehicle_type" => nil,
          "plate" => nil,
          "phone" => ["model", "Delivery::Courier::Phone"],
          "location" => ["model", "Delivery::Courier::Location"],
          "imminent" => nil
        }.freeze

        # @return [String]
        def name
          read("name")
        end

        # What the courier is riding, in English whatever locale the request carried ("Motorcycle", "Bicycle").
        # @return [String, nil]
        def vehicle
          read("vehicle")
        end

        # The machine-readable type: `bicycle`, `car`, `van`, `truck`, `scooter`, `motorcycle` or `walker`.
        # @return [String, nil]
        def vehicle_type
          read("vehicle_type")
        end

        # @return [String, nil]
        def plate
          read("plate")
        end

        # A masked number and its IVR PIN, never a personal number.
        # @return [Models::Delivery::Courier::Phone, nil]
        def phone
          read("phone")
        end

        # The live position, present only while the courier is actually in motion and only once there is a real fix.
        # @return [Models::Delivery::Courier::Location, nil]
        def location
          read("location")
        end

        # The courier is about a minute away.
        # @return [Boolean]
        def imminent
          read("imminent")
        end

        # A masked number and its IVR PIN, never a personal number.
        class Phone < Model
          TYPES = {
            "masked" => nil,
            "pin" => nil
          }.freeze

          # @return [String]
          def masked
            read("masked")
          end

          # @return [String, nil]
          def pin
            read("pin")
          end
        end

        # The live position, present only while the courier is actually in motion and only once there is a real fix.
        class Location < Model
          TYPES = {
            "lat" => nil,
            "lng" => nil,
            "updated_at" => nil
          }.freeze

          # @return [Numeric]
          def lat
            read("lat")
          end

          # @return [Numeric]
          def lng
            read("lng")
          end

          # @return [String, nil]
          def updated_at
            read("updated_at")
          end
        end
      end

      # Present only when the order carries a dropoff PIN: when you asked for one (`verification.dropoff_pincode` on the create), or when Listo...
      class Verification < Model
        TYPES = {
          "pincode" => nil
        }.freeze

        # @return [String, nil]
        def pincode
          read("pincode")
        end
      end

      # The return code (código de devolución).
      class ReturnVerification < Model
        TYPES = {
          "pincode" => nil
        }.freeze

        # @return [String, nil]
        def pincode
          read("pincode")
        end
      end

      # Proof of delivery.
      class Proof < Model
        TYPES = {
          "picture_url" => nil,
          "signature_image_url" => nil,
          "signature_name" => nil,
          "captured_at" => nil
        }.freeze

        # @return [String, nil]
        def picture_url
          read("picture_url")
        end

        # @return [String, nil]
        def signature_image_url
          read("signature_image_url")
        end

        # @return [String, nil]
        def signature_name
          read("signature_name")
        end

        # @return [String, nil]
        def captured_at
          read("captured_at")
        end
      end

      # The evidence the trip left, one entry per moment.
      class Proofs < Model
        TYPES = {
          "pickup" => ["model", "Delivery::Proofs::Pickup"],
          "dropoff" => ["model", "Delivery::Proofs::Dropoff"],
          "return" => ["model", "Delivery::Proofs::Return"]
        }.freeze

        # The courier collecting the order at the store.
        # @return [Models::Delivery::Proofs::Pickup, nil]
        def pickup
          read("pickup")
        end

        # The courier at the customer's door.
        # @return [Models::Delivery::Proofs::Dropoff, nil]
        def dropoff
          read("dropoff")
        end

        # The courier handing the order back at the store after a failed delivery.
        # @return [Models::Delivery::Proofs::Return, nil]
        def return
          read("return")
        end

        # The courier collecting the order at the store.
        class Pickup < Model
          TYPES = {
            "photo_url" => nil,
            "captured_at" => nil
          }.freeze

          # Photo of the order at the store.
          # @return [String, nil]
          def photo_url
            read("photo_url")
          end

          # When Listo first saw this photo.
          # @return [String, nil]
          def captured_at
            read("captured_at")
          end
        end

        # The courier at the customer's door.
        class Dropoff < Model
          TYPES = {
            "photo_url" => nil,
            "signature_url" => nil,
            "signer_name" => nil,
            "captured_at" => nil,
            "delivered" => nil
          }.freeze

          # Photo taken at the door.
          # @return [String, nil]
          def photo_url
            read("photo_url")
          end

          # Image of the recipient's signature.
          # @return [String, nil]
          def signature_url
            read("signature_url")
          end

          # The name the person who signed typed.
          # @return [String, nil]
          def signer_name
            read("signer_name")
          end

          # When Listo first saw this evidence.
          # @return [String, nil]
          def captured_at
            read("captured_at")
          end

          # True only when the delivery was delivered.
          # @return [Boolean]
          def delivered
            read("delivered")
          end
        end

        # The courier handing the order back at the store after a failed delivery.
        class Return < Model
          TYPES = {
            "photo_url" => nil,
            "signature_url" => nil,
            "signer_name" => nil,
            "captured_at" => nil,
            "meters_from_store" => nil
          }.freeze

          # Photo of the order handed back at the store.
          # @return [String, nil]
          def photo_url
            read("photo_url")
          end

          # Image of the signature of whoever received it at the store.
          # @return [String, nil]
          def signature_url
            read("signature_url")
          end

          # The name the person who signed typed.
          # @return [String, nil]
          def signer_name
            read("signer_name")
          end

          # When Listo first saw this evidence.
          # @return [String, nil]
          def captured_at
            read("captured_at")
          end

          # How far from the store the courier was when this was captured, in whole metres in a straight line.
          # @return [Integer, nil]
          def meters_from_store
            read("meters_from_store")
          end
        end
      end

      # What the customer rated the FOOD, for a store with the `ratings` add-on.
      class Rating < Model
        TYPES = {
          "food_stars" => nil,
          "food_reasons" => ["array", nil],
          "rated_at" => nil
        }.freeze

        # The customer's stars for the food, 1 to 5.
        # @return [Integer]
        def food_stars
          read("food_stars")
        end

        # What went wrong with the food, when the customer rated it 3 stars or fewer and chose a reason.
        # @return [Array<String>]
        def food_reasons
          read("food_reasons")
        end

        # When the customer gave the rating.
        # @return [String]
        def rated_at
          read("rated_at")
        end
      end

      # Who called the order off, and why.
      class Cancellation < Model
        TYPES = {
          "party" => nil,
          "reason" => nil,
          "description" => nil
        }.freeze

        # `partner` is you.
        # One of: "partner", "courier", "platform".
        # @return [String]
        def party
          read("party")
        end

        # The reason you sent on a cancel.
        # One of: "customer_canceled", "store_closed", "item_unavailable", "wrong_address", "no_longer_needed", "other", nil.
        # @return [String, nil]
        def reason
          read("reason")
        end

        # @return [String, nil]
        def description
          read("description")
        end
      end

      class Charge < Model
        TYPES = {
          "type" => nil,
          "amount_cents" => nil,
          "charged_at" => nil
        }.freeze

        # What the charge was for.
        # One of: "cancellation_fee", "return_fee".
        # @return [String]
        def type
          read("type")
        end

        # What you were charged, positive, in Mexican peso cents: the delivery fee for each leg that was driven, less your own store markup.
        # @return [Integer]
        def amount_cents
          read("amount_cents")
        end

        # When the charge was recorded, which is not when the delivery ended.
        # @return [String]
        def charged_at
          read("charged_at")
        end
      end

      class Refund < Model
        TYPES = {
          "id" => nil,
          "amount_cents" => nil,
          "reason" => nil,
          "status" => nil,
          "requested_via" => nil,
          "party" => nil,
          "created_at" => nil,
          "succeeded_at" => nil
        }.freeze

        # The refund id, `rfn_` prefixed.
        # @return [String]
        def id
          read("id")
        end

        # What went back, positive, in Mexican peso cents.
        # @return [Integer, nil]
        def amount_cents
          read("amount_cents")
        end

        # The free text whoever asked for the refund supplied, or null.
        # @return [String, nil]
        def reason
          read("reason")
        end

        # `pending` IS NOT A FAILURE and must not be retried: a direct-charge refund is held while the account's balance is short and applied once...
        # One of: "pending", "succeeded", "failed".
        # @return [String]
        def status
          read("status")
        end

        # Which lane issued it.
        # One of: "api", "console", "automatic", "external".
        # @return [String]
        def requested_via
          read("requested_via")
        end

        # Whose decision it was.
        # One of: "business", "platform".
        # @return [String]
        def party
          read("party")
        end

        # When the refund was asked for.
        # @return [String]
        def created_at
          read("created_at")
        end

        # When the money was confirmed on its way.
        # @return [String, nil]
        def succeeded_at
          read("succeeded_at")
        end
      end
    end
  end
end
