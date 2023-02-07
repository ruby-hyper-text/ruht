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

    def method_missing(method_name, *args, &block)
      return super unless respond_to_missing?(method_name, *args, &block)

      @child_block.binding.receiver.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, *args)
      return false unless @child_block

      @child_block.binding.receiver.respond_to?(method_name)
    end
  end
end
