# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.38.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One page of withdrawals, newest first.
    class WithdrawalList < Model
      TYPES = {
        "data" => ["array", ["model", "Withdrawal"]],
        "has_more" => nil,
        "cursor" => nil
      }.freeze

      # @return [Array<Models::Withdrawal>]
      def data
        read("data")
      end

      # True when a further page exists.
      # @return [Boolean]
      def has_more
        read("has_more")
      end

      # Pass as `cursor` to read the next page.
      # @return [String, nil]
      def cursor
        read("cursor")
      end
    end
  end
end
