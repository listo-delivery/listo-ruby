# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.42.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "events".
    class Events
      # @api private
      def initialize(client)
        @client = client
      end

      # List your webhook events.
      #
      # GET /v1/events
      # @param query [Hash, nil] query parameters (also accepted as keywords)
      # @return [Models::EventList]
      # @raise [ListoDelivery::Error]
      def list(query = nil, **fields)
        @client.execute(
          "GET",
          "/v1/events",
          query: Util.query(query, fields),
          model: Models::EventList
        )
      end

      # Send a webhook event again.
      #
      # POST /v1/events/{event_id}/resend
      # @param event_id [String]
      # @return [Models::WebhookEvent]
      # @raise [ListoDelivery::Error]
      def resend(event_id)
        @client.execute(
          "POST",
          "/v1/events/#{Util.segment(event_id)}/resend",
          model: Models::WebhookEvent
        )
      end

      # Retrieve a webhook event.
      #
      # GET /v1/events/{id}
      # @param id [String]
      # @return [Models::WebhookEvent]
      # @raise [ListoDelivery::Error]
      def retrieve(id)
        @client.execute(
          "GET",
          "/v1/events/#{Util.segment(id)}",
          model: Models::WebhookEvent
        )
      end
    end
  end
end
