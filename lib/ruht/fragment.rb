# frozen_string_literal: true

require 'ruht/closure_capturing'
require 'ruht/commenting'
require 'ruht/tags'

module Ruht
  # Represents a piece of HTML (a bunch of siblings-tags).
  # It has no name nor attributes. Not being rendered itself,
  # only renders its children.
  # Fragment.new do
  #   input
  #   p
  #   a
  #=>
  # <input>
  # <p></p>
  # <a></a>
  class Fragment
    include ClosureCapturing
    include Commenting
    include Tags

    def initialize(&child_block)
      @children = []
      @evaluated = false
      @child_block = child_block
      super(child_block&.binding&.receiver)
    end

    # Allows to render other fragments / elements inside
    def render!(child_node)
      @children << child_node
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
    end

    def can_render?(object)
      [String, Numeric, FalseClass, TrueClass, Symbol].any? do |simple_class|
        object.is_a?(simple_class)
      end
    end
  end
end
