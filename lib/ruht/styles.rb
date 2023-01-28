# frozen_string_literal: true

module Ruht
  # Formats HTML styles attribute value
  class Styles
    def initialize(styles_hash)
      @styles_hash = styles_hash
    end

    def to_s
      @styles_hash.map { "#{_1}: #{_2};" }.join(" ")
    end
  end
end
