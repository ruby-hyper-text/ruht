# frozen_string_literal: true

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
  # <p />
  # <a />
  class Fragment
    include Tags

    def initialize(&child_block)
      @children = []
      @evaluated = false
      @child_block = child_block
    end

    # Allows to render other fragments / elements inside
    def render!(child_node = nil, file: nil)
      if child_node.nil? && file.nil?
        raise ArgumentError,
              'No arguments passed to render!'
      end

      @children << (child_node || FragmentFromFile.new)
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
