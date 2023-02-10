# frozen_string_literal: true

require 'ruht/attributes'
require 'ruht/element'
require 'ruht/void_element'

module Ruht
  # Represents an HTML document
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
  class Document
    include ClosureCapturing

    def initialize(&child_block)
      @doctype = nil
      @html = nil
      @child_block = child_block

      super(@child_block&.binding&.receiver)
    end

    def doctype(*args)
      @doctype = Ruht::VoidElement.new('!DOCTYPE', Ruht::Attributes.new(*args))
    end

    def html(*args, **kwargs, &block)
      @html = Ruht::Element.new(
        :html, Ruht::Attributes.new(*args, **kwargs), &block
      )
    end

    def to_s
      instance_eval(&@child_block)
      [@doctype, @html].compact.join("\n")
    end
  end
end
