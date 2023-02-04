# frozen_string_literal: true

require 'ruht/fragment'

module Ruht
  # Represents an HTML element / node
  class Element < Fragment
    def initialize(tag_name, attributes, &child_block)
      @tag_name = tag_name
      @attributes = attributes
      super(&child_block)
    end

    def to_s
      children = super() # calls Fragment#to_s
      opening_tag = [@tag_name, @attributes].join(' ').strip
      return "<#{opening_tag} />" if children.empty?

      [
        "<#{opening_tag}>",
        children,
        "</#{@tag_name}>"
      ].join("\n").strip
    end
  end
end
