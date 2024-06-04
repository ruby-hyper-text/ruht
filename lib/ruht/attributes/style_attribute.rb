# frozen_string_literal: true

require 'ruht/attributes/content_attribute'

module Ruht
  class Attributes
    # Formats HTML style attribute value
    class StyleAttribute < ContentAttribute
      protected

      def value
        raw = super
        return raw.to_s if raw.is_a?(String)

        raw.map { |property, value| "#{property}: #{value};" }.join(' ')
      end
    end
  end
end
