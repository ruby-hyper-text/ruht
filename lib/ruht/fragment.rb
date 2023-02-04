# frozen_string_literal: true

require 'ruht/tags'

module Ruht
  class Fragment
    include Tags

    def initialize(&child_block)
      @children = []
      @evaluated = false
      @child_block = child_block
    end

    def render!(child_node)
      @children << child_node
      nil
    end

    def to_s
      eval_children!
      @children.join("\n").strip
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
      [String, Numeric, FalseClass, TrueClass, Symbol].any? do |simple_class|
        object.is_a?(simple_class)
      end
    end
  end
end
