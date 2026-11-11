# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.47.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # What a `same_day` withdrawal would cost you and how large a one you could ask for, right now.
    class SameDayTerms < Model
      TYPES = {
        "fee_cents" => nil,
        "minimum_cents" => nil,
        "ceiling_cents" => nil,
        "reach_cents" => nil,
        "advanceable_cents" => nil,
        "cap_cents" => nil,
        "cap_used_cents" => nil,
        "cap_remaining_cents" => nil,
        "window_open" => nil,
        "due_at" => nil,
        "next_window_opens_at" => nil,
        "offerable" => nil,
        "unavailable_reason" => nil
      }.freeze

      # What a same-day withdrawal costs, IVA included, charged on top of the amount.
      # @return [Integer]
      def fee_cents
        read("fee_cents")
      end

      # The smallest `amount_cents` a same-day request is accepted for.
      # @return [Integer]
      def minimum_cents
        read("minimum_cents")
      end

      # The largest `amount_cents` a same-day request would be accepted for at this moment.
      # @return [Integer]
      def ceiling_cents
        read("ceiling_cents")
      end

      # Everything a request could draw on before the fee.
      # @return [Integer]
      def reach_cents
        read("reach_cents")
      end

      # The part of `reach_cents` that is still-held cash.
      # @return [Integer]
      def advanceable_cents
        read("advanceable_cents")
      end

      # The daily maximum per account.
      # @return [Integer]
      def cap_cents
        read("cap_cents")
      end

      # How much of the daily maximum is already used today.
      # @return [Integer]
      def cap_used_cents
        read("cap_used_cents")
      end

      # What is left of the daily maximum today.
      # @return [Integer]
      def cap_remaining_cents
        read("cap_remaining_cents")
      end

      # Whether staff are sending transfers right now.
      # @return [Boolean]
      def window_open
        read("window_open")
      end

      # The deadline a request made at the moment you read this would carry.
      # @return [String]
      def due_at
        read("due_at")
      end

      # The next time sending resumes.
      # @return [String]
      def next_window_opens_at
        read("next_window_opens_at")
      end

      # False when no same-day request would be accepted at all.
      # @return [Boolean]
      def offerable
        read("offerable")
      end

      # Why `offerable` is false: `cap_reached` (today's maximum is spent) or `below_minimum` (the reach is too small to clear the floor plus the...
      # One of: "cap_reached", "below_minimum", nil.
      # @return [String, nil]
      def unavailable_reason
        read("unavailable_reason")
      end
    end
  end
end
