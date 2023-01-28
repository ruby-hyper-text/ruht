# frozen_string_literal: true

require "ruht/element"

module Ruht
  # Represents elements with no closing tag and no children
  class VoidElement
    def initialize(tag_name, attributes)
      @tag_name = tag_name
      @attributes = attributes
    end

    def to_s
      "<#{[@tag_name, @attributes].join(" ").strip}>"
    end
  end
end
