# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.38.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Proof that your key works, and which world it acts in.
    class Ping < Model
      TYPES = {
        "partner" => ["model", "Ping::Partner"],
        "mode" => nil,
        "test" => nil
      }.freeze

      # The company the key belongs to.
      # @return [Models::Ping::Partner]
      def partner
        read("partner")
      end

      # The world the key acts in.
      # One of: "live", "test".
      # @return [String]
      def mode
        read("mode")
      end

      # True when `mode` is `test`.
      # @return [Boolean]
      def test
        read("test")
      end

      # The company the key belongs to.
      class Partner < Model
        TYPES = {
          "slug" => nil,
          "name" => nil
        }.freeze

        # Your company's short handle.
        # @return [String]
        def slug
          read("slug")
        end

        # Your company's name.
        # @return [String]
        def name
          read("name")
        end
      end
    end
  end
end
