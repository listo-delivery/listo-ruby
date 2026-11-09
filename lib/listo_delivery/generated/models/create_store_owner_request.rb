# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.45.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The person to invite as the store's owner.
    class CreateStoreOwnerRequest < Model
      TYPES = {
        "name" => nil,
        "email" => nil
      }.freeze

      # @return [String]
      def name
        read("name")
      end

      # @return [String]
      def email
        read("email")
      end
    end
  end
end
