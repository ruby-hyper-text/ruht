# frozen_string_literal: true

require_relative "./styles"

module Ruht
  # Represents HTML attrbiutes.
  # Does not validate them for existance.
  class Attributes
    def initialize(*boolean_attributes, **attributes)
      @boolean_attributes = boolean_attributes
      @attributes = attributes
    end

    def to_s
      [
        @boolean_attributes.join(" "),
        @attributes.map do |name, value|
          next format_attribute(name, Ruht::Styles.new(value)) if name == :style

          format_attribute(name, value)
        end.join(" ")
      ].join(" ").strip
    end

    private

    def format_attribute(name, value)
      format('%<name>s="%<value>s"', name: name, value: value)
    end
  end
end
