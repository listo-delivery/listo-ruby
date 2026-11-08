# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.38.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "withdrawals".
    class Withdrawals
      # @api private
      def initialize(client)
        @client = client
      end

      # Request a withdrawal.
      #
      # POST /v1/withdrawals
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Withdrawal]
      # @raise [ListoDelivery::Error]
      def create(body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/withdrawals",
          body: Util.body(body, fields, required: "createWithdrawal"),
          model: Models::Withdrawal
        )
      end

      # List your withdrawals.
      #
      # GET /v1/withdrawals
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::WithdrawalList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/withdrawals",
          query: Util.query(query, fields),
          model: Models::WithdrawalList
        )
      end

      # Fetch a withdrawal.
      #
      # GET /v1/withdrawals/{id}
      # @param id [String]
      # @return [Models::Withdrawal]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/withdrawals/#{Util.segment(id)}",
          model: Models::Withdrawal
        )
      end
    end
  end
end
