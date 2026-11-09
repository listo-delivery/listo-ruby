# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "quotes".
    class Quotes
      # @api private
      def initialize(client)
        @client = client
      end

      # Price a delivery.
      #
      # POST /v1/quotes
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Quote]
      # @raise [ListoDelivery::Error]
      def create(body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/quotes",
          body: Util.body(body, fields, required: "createQuote"),
          model: Models::Quote
        )
      end
    end
  end
end
