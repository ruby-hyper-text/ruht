# frozen_string_literal: true

require "ruht/data_attributes"
require "ruht/styles"

module Ruht
  # Represents HTML attrbiutes.
  # Does not validate them for existance.
  class Attributes
    def initialize(*boolean_attributes,
                   style: nil, data: nil, **content_attributes)
      @boolean_attributes = boolean_attributes
      @style_attribute_value = style
      @data_attributes_hash = data
      @content_attributes = content_attributes
    end

    def to_s
      [
        @boolean_attributes.join(" "),
        style_attribute,
        @content_attributes.map { format_attribute(_1, _2) }.join(" "),
        data_attributes
      ].compact.join(" ").strip
    end

    private

    def format_attribute(name, value)
      format('%<name>s="%<value>s"', name: name, value: value)
    end

    def style_attribute
      return nil if @style_attribute_value.nil?

      format_attribute(:style, Ruht::Styles.new(@style_attribute_value))
    end

    def data_attributes
      return nil if @data_attributes_hash.nil?

      Ruht::DataAttributes.new(@data_attributes_hash)
    end
  end
end
