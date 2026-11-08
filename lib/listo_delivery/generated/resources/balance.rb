# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.38.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "balance".
    class Balance
      # @api private
      def initialize(client)
        @client = client
      end

      # Read your prepaid balance.
      #
      # GET /v1/balance
      # @return [Models::Balance]
      # @raise [ListoDelivery::Error]
      def retrieve
        @client.execute(
          "GET",
          "/v1/balance",
          model: Models::Balance
        )
      end

      # Read a store's balance.
      #
      # GET /v1/stores/{store_id}/balance
      # @param store_id [String]
      # @return [Models::StoreBalance]
      # @raise [ListoDelivery::Error]
      def retrieve_for_store(store_id)
        @client.execute(
          "GET",
          "/v1/stores/#{Util.segment(store_id)}/balance",
          model: Models::StoreBalance
        )
      end
    end
  end
end
