# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.44.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # A connection request waiting for the restaurant owner to approve it.
    class ConnectRequest < Model
      TYPES = {
        "url" => nil,
        "expires_at" => nil
      }.freeze

      # The consent page to send the owner to.
      # @return [String]
      def url
        read("url")
      end

      # When the link stops working.
      # @return [String]
      def expires_at
        read("expires_at")
      end
    end
  end
end
