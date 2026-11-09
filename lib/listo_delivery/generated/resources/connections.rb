# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.40.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "connections".
    class Connections
      # @api private
      def initialize(client)
        @client = client
      end

      # Exchange an approval for the store.
      #
      # POST /v1/connections
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def create(body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/connections",
          body: Util.body(body, fields, required: "createConnection"),
          model: Models::Store
        )
      end
    end
  end
end
