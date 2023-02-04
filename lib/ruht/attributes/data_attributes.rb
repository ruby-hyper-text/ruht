# frozen_string_literal: true

require 'ruht/attributes/content_attribute'

module Ruht
  class Attributes
    # Formats HTML data attributes
    class DataAttributes
      def initialize(_name, values)
        @values = values
      end

      def to_s
        @values.map do |attribute, value|
          ContentAttribute.new("data-#{attribute}", value)
        end.join(' ')
      end
    end
  end
end
