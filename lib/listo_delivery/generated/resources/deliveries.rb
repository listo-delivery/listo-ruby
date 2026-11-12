# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "deliveries".
    class Deliveries
      # @api private
      def initialize(client)
        @client = client
      end

      # Cancel a delivery.
      #
      # POST /v1/deliveries/{delivery_id}/cancellations
      # @param delivery_id [String]
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def cancel(delivery_id, body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/deliveries/#{Util.segment(delivery_id)}/cancellations",
          body: Util.body(body, fields, required: "cancelDelivery"),
          model: Models::Delivery
        )
      end

      # Create a delivery.
      #
      # POST /v1/deliveries
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @param idempotency_key [String, nil] your own key; a fresh UUID is sent when omitted
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def create(body = nil, idempotency_key: nil, **fields)
        @client.execute(
          "POST",
          "/v1/deliveries",
          body: Util.body(body, fields, required: "createDelivery"),
          idempotent: true,
          idempotency_key: idempotency_key,
          model: Models::Delivery
        )
      end

      # List deliveries.
      #
      # GET /v1/deliveries
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::DeliveryList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/deliveries",
          query: Util.query(query, fields),
          model: Models::DeliveryList
        )
      end

      # Refund a delivery.
      #
      # POST /v1/deliveries/{delivery_id}/refunds
      # @param delivery_id [String]
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @param idempotency_key [String, nil] your own key; a fresh UUID is sent when omitted
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def refund(delivery_id, body = nil, idempotency_key: nil, **fields)
        @client.execute(
          "POST",
          "/v1/deliveries/#{Util.segment(delivery_id)}/refunds",
          body: Util.body(body, fields),
          idempotent: true,
          idempotency_key: idempotency_key,
          model: Models::Delivery
        )
      end

      # Update a delivery.
      #
      # PATCH /v1/deliveries/{id}
      # @param id [String]
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def reschedule(id, body = nil, **fields)
        @client.execute(
          "PATCH",
          "/v1/deliveries/#{Util.segment(id)}",
          body: Util.body(body, fields, required: "rescheduleDelivery"),
          model: Models::Delivery
        )
      end

      # Fetch a delivery.
      #
      # GET /v1/deliveries/{id}
      # @param id [String]
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/deliveries/#{Util.segment(id)}",
          model: Models::Delivery
        )
      end

      # Retry a failed dispatch.
      #
      # POST /v1/deliveries/{delivery_id}/retries
      # @param delivery_id [String]
      # @return [Models::Delivery]
      # @raise [ListoDelivery::Error]
      def retry(delivery_id)
        @client.execute(
          "POST",
          "/v1/deliveries/#{Util.segment(delivery_id)}/retries",
          model: Models::Delivery
        )
      end
    end
  end
end
