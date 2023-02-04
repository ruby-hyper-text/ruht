# frozen_string_literal: true

module Ruht
  # DSL magic here. Including this module will define methods for HTML tags.
  module Tags
    # Must be implemented
    def render!(_element)
      raise NotImplementedError
    end

    # Allows to define new tags
    module ClassMethods
      def def_tag(tag_name)
        define_method(tag_name) do |*args, **kwargs, &block|
          require 'ruht/attributes'
          attributes = Ruht::Attributes.new(*args, **kwargs)

          require 'ruht/element'
          element = Ruht::Element.new(tag_name, attributes, &block)
          render!(element)
        end
      end

      def def_void_tag(tag_name)
        define_method(tag_name) do |*args, **kwargs|
          require 'ruht/attributes'
          attributes = Ruht::Attributes.new(*args, **kwargs)

          require 'ruht/void_element'
          element = Ruht::VoidElement.new(tag_name, attributes)
          render!(element)
        end
      end
    end

    def self.included(receiver)
      receiver.extend ClassMethods

      receiver.instance_eval do
        %i[head body title main p span time script style pre].each do |tag|
          def_tag tag
        end

        %i[meta input].each do |tag|
          def_void_tag tag
        end
      end
    end
  end
end
