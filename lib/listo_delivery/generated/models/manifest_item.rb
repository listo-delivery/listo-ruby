# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.46.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One line of the descriptive item list sent to the courier.
    class ManifestItem < Model
      TYPES = {
        "name" => nil,
        "quantity" => nil,
        "size" => nil
      }.freeze

      # What the item is.
      # @return [String]
      def name
        read("name")
      end

      # How many of it.
      # @return [Integer]
      def quantity
        read("quantity")
      end

      # How big the item is.
      # One of: "small", "medium", "large", "xlarge", nil.
      # @return [String, nil]
      def size
        read("size")
      end
    end
  end
end
