# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.46.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    class WithdrawalUpdatedEvent < WebhookEvent
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => ["model", "Withdrawal"]
      }.freeze

      # @return [Models::Withdrawal]
      def data
        read("data")
      end
    end
  end
end
