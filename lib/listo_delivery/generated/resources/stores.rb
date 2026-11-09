# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "stores".
    class Stores
      # @api private
      def initialize(client)
        @client = client
      end

      # Cancel a store's plan.
      #
      # POST /v1/stores/{store_id}/plan_cancellation
      # @param store_id [String]
      # @param idempotency_key [String, nil] your own key; a fresh UUID is sent when omitted
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def cancel_plan(store_id, idempotency_key: nil)
        @client.execute(
          "POST",
          "/v1/stores/#{Util.segment(store_id)}/plan_cancellation",
          idempotent: true,
          idempotency_key: idempotency_key,
          model: Models::Store
        )
      end

      # Create a store.
      #
      # POST /v1/stores
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @param idempotency_key [String, nil] your own key; a fresh UUID is sent when omitted
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def create(body = nil, idempotency_key: nil, **fields)
        @client.execute(
          "POST",
          "/v1/stores",
          body: Util.body(body, fields, required: "createStore"),
          idempotent: true,
          idempotency_key: idempotency_key,
          model: Models::Store
        )
      end

      # Invite a store owner.
      #
      # POST /v1/stores/{store_id}/owner
      # @param store_id [String]
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::OwnerInvitation]
      # @raise [ListoDelivery::Error]
      def create_owner(store_id, body = nil, **fields)
        @client.execute(
          "POST",
          "/v1/stores/#{Util.segment(store_id)}/owner",
          body: Util.body(body, fields, required: "createStoreOwner"),
          model: Models::OwnerInvitation
        )
      end

      # List your stores.
      #
      # GET /v1/stores
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::StoreList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/stores",
          query: Util.query(query, fields),
          model: Models::StoreList
        )
      end

      # Reactivate a store's plan.
      #
      # POST /v1/stores/{store_id}/plan
      # @param store_id [String]
      # @param idempotency_key [String, nil] your own key; a fresh UUID is sent when omitted
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def reactivate_plan(store_id, idempotency_key: nil)
        @client.execute(
          "POST",
          "/v1/stores/#{Util.segment(store_id)}/plan",
          idempotent: true,
          idempotency_key: idempotency_key,
          model: Models::Store
        )
      end

      # Fetch a store.
      #
      # GET /v1/stores/{id}
      # @param id [String]
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/stores/#{Util.segment(id)}",
          model: Models::Store
        )
      end

      # Undo a store's plan cancellation.
      #
      # DELETE /v1/stores/{store_id}/plan_cancellation
      # @param store_id [String]
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def undo_plan_cancellation(store_id)
        @client.execute(
          "DELETE",
          "/v1/stores/#{Util.segment(store_id)}/plan_cancellation",
          model: Models::Store
        )
      end

      # Update a store.
      #
      # PATCH /v1/stores/{id}
      # @param id [String]
      # @param body [Hash, nil] request body (also accepted as keywords)
      # @return [Models::Store]
      # @raise [ListoDelivery::Error]
      def update(id, body = nil, **fields)
        @client.execute(
          "PATCH",
          "/v1/stores/#{Util.segment(id)}",
          body: Util.body(body, fields),
          model: Models::Store
        )
      end
    end
  end
end
