# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.44.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # The descriptive item list for the courier.
    class Manifest < Model
      TYPES = {
        "items" => ["array", ["model", "ManifestItem"]]
      }.freeze

      # @return [Array<Models::ManifestItem>, nil]
      def items
        read("items")
      end
    end
  end
end
