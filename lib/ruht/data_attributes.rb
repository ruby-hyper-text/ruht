# frozen_string_literal: true

module Ruht
  # Formats HTML data attributes
  class DataAttributes
    def initialize(data_hash)
      @data_hash = data_hash
    end

    def to_s
      @data_hash.map { format_attribute(_1, _2) }.join(" ")
    end

    private

    def format_attribute(name, value)
      format('data-%<name>s="%<value>s"', name: name, value: value)
    end
  end
end

puts Ruht::DataAttributes.new(key: 1, behavior: :delete).to_s
