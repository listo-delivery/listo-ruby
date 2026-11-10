# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.46.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # A one-time hosted link to complete card onboarding.
    class CardOnboardingLink < Model
      TYPES = {
        "url" => nil
      }.freeze

      # Send this to whoever can answer for the business.
      # @return [String]
      def url
        read("url")
      end
    end
  end
end
