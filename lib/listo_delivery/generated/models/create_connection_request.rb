# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.40.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The one-time code from an approved connect request.
    class CreateConnectionRequest < Model
      TYPES = {
        "code" => nil
      }.freeze

      # The `pcc_` code that arrived at your `redirect_uri`.
      # @return [String]
      def code
        read("code")
      end
    end
  end
end
