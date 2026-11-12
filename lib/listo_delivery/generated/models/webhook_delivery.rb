# frozen_string_literal: true

# GENERATED from Listo's API definition (API 1.48.0). Do not edit by hand:
# this file is rewritten whenever the SDK is regenerated.

module ListoDelivery
  module Models
    # One attempt to POST an event to your webhook URL, and what came back.
    class WebhookDelivery < Model
      TYPES = {
        "id" => nil,
        "event_id" => nil,
        "event_type" => nil,
        "attempt" => nil,
        "resent" => nil,
        "url" => nil,
        "status_code" => nil,
        "error_message" => nil,
        "response_body" => nil,
        "duration_ms" => nil,
        "succeeded" => nil,
        "created_at" => nil
      }.freeze

      # The attempt's id, `whd_` prefixed.
      # @return [String]
      def id
        read("id")
      end

      # The event this was an attempt to deliver, `evt_` prefixed.
      # @return [String]
      def event_id
        read("event_id")
      end

      # The type of that event.
      # One of: "delivery.status_changed", "delivery.updated", "delivery.courier_location", "withdrawal.updated", "store.updated", "store.connected", "delivery.message_skipped", "delivery.rated".
      # @return [String]
      def event_type
        read("event_type")
      end

      # Which attempt this is for the event, counted from 1 in the order they were made.
      # @return [Integer]
      def attempt
        read("attempt")
      end

      # True when you asked for this attempt (`POST /v1/events/{id}/resend`) rather than Listo making it on its own schedule.
      # @return [Boolean]
      def resent
        read("resent")
      end

      # The URL that was posted to, as it was when the attempt was made.
      # @return [String]
      def url
        read("url")
      end

      # The HTTP status your endpoint answered with.
      # @return [Integer, nil]
      def status_code
        read("status_code")
      end

      # Why the attempt counted as failed, in words (a timeout, a refused connection, a non-2xx status).
      # @return [String, nil]
      def error_message
        read("error_message")
      end

      # The first 500 characters of the body your endpoint answered with.
      # @return [String, nil]
      def response_body
        read("response_body")
      end

      # How long the attempt took, in milliseconds.
      # @return [Integer, nil]
      def duration_ms
        read("duration_ms")
      end

      # True when your endpoint answered with a 2xx.
      # @return [Boolean]
      def succeeded
        read("succeeded")
      end

      # When the attempt was made, ISO-8601 in UTC.
      # @return [String]
      def created_at
        read("created_at")
      end
    end
  end
end
