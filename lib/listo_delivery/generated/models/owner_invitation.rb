# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.45.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The invitation sent to a store's owner.
    class OwnerInvitation < Model
      TYPES = {
        "email" => nil,
        "invited_at" => nil
      }.freeze

      # The address the invitation went to.
      # @return [String]
      def email
        read("email")
      end

      # @return [String]
      def invited_at
        read("invited_at")
      end
    end
  end
end
