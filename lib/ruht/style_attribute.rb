# frozen_string_literal: true

module Ruht
  # Formats HTML style attribute value
  class StyleAttribute
    def initialize(styles_hash)
      @styles_hash = styles_hash
    end

    def to_s
      return @styles_hash.to_s if @styles_hash.is_a?(String)

      @styles_hash.map { "#{_1}: #{_2};" }.join(" ")
    end
  end
end
