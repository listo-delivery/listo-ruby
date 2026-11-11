# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.47.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # Every event your webhook endpoint receives, and every event the debugging reads return: one of the eight below, told apart by `type`.
    class WebhookEvent < Model
      TYPES = {
        "id" => nil,
        "created_at" => nil,
        "test" => nil,
        "type" => nil,
        "data" => nil
      }.freeze

      # type value => class name.
      VARIANTS = {
        "delivery.courier_location" => "DeliveryCourierLocationEvent",
        "delivery.message_skipped" => "DeliveryMessageSkippedEvent",
        "delivery.rated" => "DeliveryRatedEvent",
        "delivery.status_changed" => "DeliveryStatusChangedEvent",
        "delivery.updated" => "DeliveryUpdatedEvent",
        "store.connected" => "StoreConnectedEvent",
        "store.updated" => "StoreUpdatedEvent",
        "withdrawal.updated" => "WithdrawalUpdatedEvent"
      }.freeze

      # Builds the variant named by "type"; a value of a kind this SDK
      # does not know yet stays a plain WebhookEvent, never an error.
      def self.build(value)
        return super unless equal?(WebhookEvent)
        return value unless value.is_a?(Hash)

        name = VARIANTS[(value["type"] || value[:type]).to_s]
        name ? Models.const_get(name).new(value) : new(value)
      end

      # The event id, `evt_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # When the event was recorded, ISO-8601 in UTC.
      # @return [String]
      def created_at
        read("created_at")
      end

      # Present, and true, only on a test event you asked for with `POST /v1/test_webhooks`.
      # @return [Boolean, nil]
      def test
        read("test")
      end

      # Which event this is.
      # @return [String]
      def type
        read("type")
      end

      # @return [Object]
      def data
        read("data")
      end
    end
  end
end
