# frozen_string_literal: true

require "erb"
require "uri"

module ListoDelivery
  # Argument handling shared by the generated resource methods.
  # @api private
  module Util
    module_function

    # A path parameter, escaped so an id can never change the route.
    def segment(value)
      text = value.to_s
      raise ArgumentError, "a path parameter must not be blank" if text.strip.empty?

      ERB::Util.url_encode(text)
    end

    # The request body: the positional Hash merged with keyword fields, nil
    # when neither was given (so nothing is sent) unless `required` names
    # the operation that needs one.
    def body(body, fields, required: nil)
      reject_idempotency_key(fields)
      merged = merge(body, fields)
      raise ArgumentError, "#{required} needs a request body" if merged.nil? && required

      merged
    end

    # The query string pairs as a Hash, nil when empty.
    def query(query, fields)
      reject_idempotency_key(fields)
      merged = merge(query, fields)
      merged&.reject { |_, v| v.nil? }
    end

    # Only the operations that declare the Idempotency-Key header take
    # `idempotency_key:`, and those methods capture it as a keyword before
    # `fields` exists. One that reaches `fields` belongs to an operation
    # without the header, where it would otherwise be sent as a body or
    # query field the API drops, and the caller would think the call was
    # protected. A body field genuinely named so goes inside the Hash.
    def reject_idempotency_key(fields)
      return unless fields.key?(:idempotency_key)

      raise ArgumentError,
        "this operation does not take an idempotency key; " \
        "to send a field named idempotency_key, put it inside the Hash argument"
    end

    def merge(first, fields)
      base = first.nil? ? nil : plain(first)
      raise ArgumentError, "expected a Hash, got #{first.class}" unless base.nil? || base.is_a?(Hash)

      extra = plain(fields)
      return base if extra.empty?

      (base || {}).merge(extra)
    end

    # Models and symbol keys become plain JSON-shaped data.
    def plain(value)
      case value
      when Model then plain(value.to_h)
      when Hash then value.each_with_object({}) { |(k, v), h| h[k.to_s] = plain(v) }
      when Array then value.map { |v| plain(v) }
      else value
      end
    end

    def encode_query(pairs)
      URI.encode_www_form(pairs)
    end
  end
end
