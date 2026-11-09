# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.41.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The body of every 4xx and 5xx answer on this API.
    class ErrorResponse < Model
      TYPES = {
        "error" => ["model", "Error"]
      }.freeze

      # @return [Models::Error]
      def error
        read("error")
      end
    end
  end
end
