# frozen_string_literal: true

module Ruht
  class Attributes
    # Formats HTML boolean attributes.
    # Boolean attributes are the ones without values
    # (e. g. <input disabled required checked readonly ...> )
    class BooleanAttribute
      def initialize(name)
        @name = name
      end

      def to_s
        @name.to_s
      end
    end
  end
end
