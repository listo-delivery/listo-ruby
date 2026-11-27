# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.52.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "orders".
    class Orders
      # @api private
      def initialize(client)
        @client = client
      end

      # List orders.
      #
      # GET /v1/orders
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::OrderList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/orders",
          query: Util.query(query, fields),
          model: Models::OrderList
        )
      end

      # Get an order.
      #
      # GET /v1/orders/{id}
      # @param id [String]
      # @return [Models::Order]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/orders/#{Util.segment(id)}",
          model: Models::Order
        )
      end
    end
  end
end
