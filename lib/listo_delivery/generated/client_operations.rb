# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.37.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  # The resource readers and the root operations of Client, from Listo's API definition.
  module ClientOperations
    # @return [Resources::Balance]
    def balance
      @balance ||= Resources::Balance.new(self)
    end

    # @return [Resources::CardOnboarding]
    def card_onboarding
      @card_onboarding ||= Resources::CardOnboarding.new(self)
    end

    # @return [Resources::ConnectRequests]
    def connect_requests
      @connect_requests ||= Resources::ConnectRequests.new(self)
    end

    # @return [Resources::Connections]
    def connections
      @connections ||= Resources::Connections.new(self)
    end

    # @return [Resources::Deliveries]
    def deliveries
      @deliveries ||= Resources::Deliveries.new(self)
    end

    # @return [Resources::Events]
    def events
      @events ||= Resources::Events.new(self)
    end

    # @return [Resources::Ledger]
    def ledger
      @ledger ||= Resources::Ledger.new(self)
    end

    # @return [Resources::Quotes]
    def quotes
      @quotes ||= Resources::Quotes.new(self)
    end

    # @return [Resources::RequestLogs]
    def request_logs
      @request_logs ||= Resources::RequestLogs.new(self)
    end

    # @return [Resources::Stores]
    def stores
      @stores ||= Resources::Stores.new(self)
    end

    # @return [Resources::Webhooks]
    def webhooks
      @webhooks ||= Resources::Webhooks.new(self)
    end

    # @return [Resources::Withdrawals]
    def withdrawals
      @withdrawals ||= Resources::Withdrawals.new(self)
    end

    # Check that your API key works.
    #
    # GET /v1/ping
    # @return [Models::Ping]
    # @raise [ListoDelivery::Error]
    def ping
      execute(
        "GET",
        "/v1/ping",
        model: Models::Ping
      )
    end
  end
end
