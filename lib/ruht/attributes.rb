# frozen_string_literal: true

require 'ruht/data_attributes'
require 'ruht/class_attribute'
require 'ruht/style_attribute'

module Ruht
  # Represents HTML attrbiutes.
  # Does not validate them for existance.
  class Attributes
    def initialize(*boolean_attributes,
                   class: nil, style: nil, data: nil, **content_attributes)
      @boolean_attributes = boolean_attributes
      @style_attribute_value = style
      @data_attributes_hash = data
      @class_list = binding.local_variable_get(:class)
      @content_attributes = content_attributes
    end

    def to_s
      [
        class_attribute,
        style_attribute,
        @boolean_attributes.join(' '),
        @content_attributes.map { format_attribute(_1, _2) }.join(' '),
        data_attributes
      ].compact.join(' ').strip
    end

    private

    def format_attribute(name, value)
      format('%<name>s="%<value>s"', name: name, value: value)
    end

    def class_attribute
      return nil if @class_list.nil?

      format_attribute(
        :class, Ruht::ClassAttribute.new(@class_list || []).to_s
      )
    end

    def style_attribute
      return nil if @style_attribute_value.nil?

      format_attribute(
        :style, Ruht::StyleAttribute.new(@style_attribute_value || {}).to_s
      )
    end

    def data_attributes
      return nil if @data_attributes_hash.nil?

      Ruht::DataAttributes.new(@data_attributes_hash || {}).to_s
    end
  end
end
