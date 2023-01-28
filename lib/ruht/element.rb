# frozen_string_literal: true

require "ruht/tags"

module Ruht
  # Represents an HTML element
  class Element
    include Tags

    def initialize(tag_name, attributes, &child_block)
      @tag_name = tag_name
      @children = []
      @evaluated = false
      @attributes = attributes
      @child_block = child_block
    end

    def render!(child_node)
      @children << child_node
      nil
    end

    def to_s
      eval_children!
      opening_tag = [@tag_name, @attributes].join(" ").strip
      <<~HTML.strip
        <#{opening_tag}>
        #{@children.join("\n")}
        </#{@tag_name}>
      HTML
    end

    private

    def eval_children!
      return if @evaluated || @child_block.nil?

      result = instance_eval(&@child_block)
      render!(result) if can_render?(result)
      @evaluated = true
      nil
    end

    def can_render?(object)
      [String, Numeric, FalseClass, TrueClass].any? do |simple_class|
        object.is_a?(simple_class)
      end
    end
  end
end
