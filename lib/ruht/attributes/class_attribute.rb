# frozen_string_literal: true

require 'ruht/attributes/content_attribute'

module Ruht
  class Attributes
    # Formats HTML class attribute value
    class ClassAttribute < ContentAttribute
      protected

      def value
        raw = super()
        return raw if raw.is_a?(String)

        raw.join(' ')
      end
    end
  end
end
