# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.43.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "ledger".
    class Ledger
      # @api private
      def initialize(client)
        @client = client
      end

      # List your ledger entries.
      #
      # GET /v1/ledger
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::LedgerEntryList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/ledger",
          query: Util.query(query, fields),
          model: Models::LedgerEntryList
        )
      end

      # List a store's ledger entries.
      #
      # GET /v1/stores/{store_id}/ledger
      # @param store_id [String]
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::LedgerEntryList]
      # @raise [ListoDelivery::Error]
      def list_for_store(store_id, query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/stores/#{Util.segment(store_id)}/ledger",
          query: Util.query(query, fields),
          model: Models::LedgerEntryList
        )
      end
    end
  end
end
