# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The restaurant owner to ask, and where to send them back.
    class CreateConnectRequestRequest < Model
      TYPES = {
        "owner_email" => nil,
        "redirect_uri" => nil,
        "state" => nil
      }.freeze

      # The email of the person who signs in to the restaurant's Listo account.
      # @return [String]
      def owner_email
        read("owner_email")
      end

      # Where the owner's browser returns after approving.
      # @return [String]
      def redirect_uri
        read("redirect_uri")
      end

      # An opaque value returned to `redirect_uri` unchanged, up to 255 characters.
      # @return [String, nil]
      def state
        read("state")
      end
    end
  end
end
