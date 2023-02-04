# frozen_string_literal: true

require 'ruht/attributes/content_attribute'

module Ruht
  class Attributes
    # Formats HTML data attributes
    class DataAttributes
      def initialize(_name, value)
        @value = value
      end

      def to_s
        @value.map { ContentAttribute.new("data-#{_1}", _2) }.join(' ')
      end
    end
  end
end
