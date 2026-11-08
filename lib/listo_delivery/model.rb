# frozen_string_literal: true

module ListoDelivery
  # Base of every generated model. A model wraps the JSON object as received:
  # a reader per documented field (by wire name), `#to_h` and `#[]`, and any
  # field the server adds later stays in `#to_h` instead of breaking parsing.
  class Model
    # Field name => how to convert it (nil for a plain JSON value). Each
    # generated class replaces this.
    TYPES = {}.freeze

    # Turns a parsed JSON value into this model; anything that is not an
    # object comes back untouched.
    def self.build(value)
      value.is_a?(Hash) ? new(value) : value
    end

    # @param data [Hash] the JSON object, string or symbol keys
    def initialize(data = {})
      @raw = Util.plain(data)
      @cache = {}
    end

    # The JSON object, unknown keys included. A copy: changing it changes nothing here.
    def to_h
      Util.plain(@raw)
    end

    # The field named as on the wire, converted like its reader.
    def [](key)
      read(key.to_s)
    end

    def ==(other)
      other.class == self.class && other.to_h == to_h
    end
    alias_method :eql?, :==

    def hash
      [self.class, @raw].hash
    end

    def inspect
      "#<#{self.class.name} #{@raw.inspect}>"
    end

    def to_json(*args)
      @raw.to_json(*args)
    end

    private

    def read(name)
      return @cache[name] if @cache.key?(name)

      @cache[name] = convert(self.class::TYPES[name], @raw[name])
    end

    def convert(descriptor, value)
      return value if descriptor.nil? || value.nil?

      case descriptor.first
      when "model" then Models.const_get(descriptor.last).build(value)
      when "array" then value.is_a?(Array) ? value.map { |v| convert(descriptor.last, v) } : value
      else value
      end
    end
  end
end
