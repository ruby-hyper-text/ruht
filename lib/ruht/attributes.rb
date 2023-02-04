# frozen_string_literal: true

require 'ruht/attributes/boolean_attribute'
require 'ruht/attributes/class_attribute'
require 'ruht/attributes/content_attribute'
require 'ruht/attributes/data_attributes'
require 'ruht/attributes/style_attribute'

module Ruht
  # Represents HTML attributes.
  # Does not validate them for existance.
  class Attributes
    def initialize(*boolean_attributes, **content_attributes)
      @boolean_attributes = boolean_attributes
      @content_attributes = content_attributes
    end

    def to_s
      [
        *boolean_attributes,
        *content_attributes
      ].compact.join(' ').strip
    end

    private

    def boolean_attributes
      @boolean_attributes.map do |attr_name|
        BooleanAttribute.new(attr_name)
      end
    end

    def content_attributes
      @content_attributes.map do |attr_name, attr_value|
        case attr_name.to_sym
        when :class then ClassAttribute.new(attr_name, attr_value)
        when :data then DataAttributes.new(attr_name, attr_value)
        when :style then StyleAttribute.new(attr_name, attr_value)
        else ContentAttribute.new(attr_name, attr_value)
        end
      end
    end
  end
end
