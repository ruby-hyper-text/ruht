# frozen_string_literal: true

module Ruht
  # DSL magic here
  module Tags
    # Allows to define new tags
    module ClassMethods
      def def_tag(tag_name)
        define_method(tag_name) do |*args, **kwargs, &block|
          require "ruht/attributes"
          attributes = Ruht::Attributes.new(*args, **kwargs)

          require "ruht/element"
          node = Ruht::Element.new(tag_name, attributes, &block)
          render!(node)
        end
      end

      def def_void_tag(tag_name)
        define_method(tag_name) do |*args, **kwargs|
          require "ruht/attributes"
          attributes = Ruht::Attributes.new(*args, **kwargs)

          require "ruht/void_element"
          node = Ruht::VoidElement.new(tag_name, attributes)
          render!(node)
        end
      end
    end

    def self.included(receiver)
      receiver.extend ClassMethods

      receiver.instance_eval do
        %i[html head body title main p span time script].each do |tag|
          def_tag tag
        end

        def_void_tag :input
      end
    end
  end
end
