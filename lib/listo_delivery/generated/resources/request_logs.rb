# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.47.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "request_logs".
    class RequestLogs
      # @api private
      def initialize(client)
        @client = client
      end

      # List your request log.
      #
      # GET /v1/request_logs
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::RequestLogList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/request_logs",
          query: Util.query(query, fields),
          model: Models::RequestLogList
        )
      end

      # Retrieve a request log entry.
      #
      # GET /v1/request_logs/{id}
      # @param id [String]
      # @return [Models::RequestLogDetail]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/request_logs/#{Util.segment(id)}",
          model: Models::RequestLogDetail
        )
      end
    end
  end
end
