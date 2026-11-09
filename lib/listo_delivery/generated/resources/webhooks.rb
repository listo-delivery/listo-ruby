# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.42.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "webhooks".
    class Webhooks
      # @api private
      def initialize(client)
        @client = client
      end

      # List webhook delivery attempts.
      #
      # GET /v1/webhook_deliveries
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::WebhookDeliveryList]
      # @raise [ListoDelivery::Error]
      def list_deliveries(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/webhook_deliveries",
          query: Util.query(query, fields),
          model: Models::WebhookDeliveryList
        )
      end

      # Send a test webhook.
      #
      # POST /v1/test_webhooks
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::WebhookEvent]
      # @raise [ListoDelivery::Error]
      def send_test(body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/test_webhooks",
          body: Util.body(body, fields, required: "sendTestWebhook"),
          model: Models::WebhookEvent
        )
      end
    end
  end
end
