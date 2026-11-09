# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.45.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Whether card payments can be taken yet.
    class CardStatus < Model
      TYPES = {
        "status" => nil
      }.freeze

      # `not_started` means onboarding has not been opened, `verifying` that the details are in and under review, `action_required` that more...
      # One of: "not_started", "verifying", "action_required", "connected".
      # @return [String]
      def status
        read("status")
      end
    end
  end
end
