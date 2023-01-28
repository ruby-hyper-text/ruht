# frozen_string_literal: true

require "ruht/attributes"
require "ruht/element"
require "ruht/void_element"

module Ruht
  # Represents a piece of HTML with no wrappers
  # Document.new do
  #   doctype :html
  #   html do
  #     ...
  #   end
  # end.to_s
  #=>
  # <!DOCTYPE html>
  # <html>
  # ...
  # </html>
  class Document < Ruht::Element
    def initialize(&block)
      super("", Ruht::Attributes.new, &block)
    end

    def doctype(*args)
      render!(Ruht::VoidElement.new("!DOCTYPE", Ruht::Attributes.new(*args)))
    end

    def to_s
      eval_children!
      @children.join("\n")
    end
  end
end
