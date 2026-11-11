# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.47.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Resources
    # Operations under "card_onboarding".
    class CardOnboarding
      # @api private
      def initialize(client)
        @client = client
      end

      # Start card onboarding for your company.
      #
      # POST /v1/stripe_onboarding
      # @return [Models::CardOnboardingLink]
      # @raise [ListoDelivery::Error]
      def create
        @client.execute(
          "POST",
          "/v1/stripe_onboarding",
          model: Models::CardOnboardingLink
        )
      end

      # Start card onboarding for a store.
      #
      # POST /v1/stores/{store_id}/stripe_onboarding
      # @param store_id [String]
      # @return [Models::CardOnboardingLink]
      # @raise [ListoDelivery::Error]
      def create_for_store(store_id)
        @client.execute(
          "POST",
          "/v1/stores/#{Util.segment(store_id)}/stripe_onboarding",
          model: Models::CardOnboardingLink
        )
      end

      # Read your company's card readiness.
      #
      # GET /v1/stripe_status
      # @return [Models::CardStatus]
      # @raise [ListoDelivery::Error]
      def status
        @client.execute(
          "GET",
          "/v1/stripe_status",
          model: Models::CardStatus
        )
      end

      # Read a store's card readiness.
      #
      # GET /v1/stores/{store_id}/stripe_status
      # @param store_id [String]
      # @return [Models::CardStatus]
      # @raise [ListoDelivery::Error]
      def status_for_store(store_id)
        @client.execute(
          "GET",
          "/v1/stores/#{Util.segment(store_id)}/stripe_status",
          model: Models::CardStatus
        )
      end
    end
  end
end
