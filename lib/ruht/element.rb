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

    # There is no such thing as self closing tags. E.g. <img /> or <script />.
    # https://developer.mozilla.org/en-US/docs/Glossary/Void_element#self-closing_tags
    def to_s
      children = super # calls Fragment#to_s
      opening_tag = [@tag_name, @attributes].join(' ').strip
      closing_tag = "/#{@tag_name}"
      return "<#{opening_tag}><#{closing_tag}>" if children.empty?

      [
        "<#{opening_tag}>",
        children.lines.map { "  #{_1}" }.join,
        "<#{closing_tag}>"
      ].join("\n").strip
    end
  end
end
