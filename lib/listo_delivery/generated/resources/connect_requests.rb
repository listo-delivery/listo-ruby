# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "connect_requests".
    class ConnectRequests
      # @api private
      def initialize(client)
        @client = client
      end

      # Ask a restaurant to connect its account.
      #
      # POST /v1/connect_requests
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::ConnectRequest]
      # @raise [ListoDelivery::Error]
      def create(body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/connect_requests",
          body: Util.body(body, fields, required: "createConnectRequest"),
          model: Models::ConnectRequest
        )
      end
    end
  end
end
