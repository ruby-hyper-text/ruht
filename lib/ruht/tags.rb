# frozen_string_literal: true

module Ruht
  # DSL magic here. Including this module will define methods for HTML tags.
  module Tags
    # https://developer.mozilla.org/en-US/docs/Web/HTML/Element
    TAG_NAMES = %i[
      head style title body
      address article aside footer header h1 h2 h3 h4 h5 h6 main nav section
      blockquote dd div dl dt figcaption figure li menu ol p pre ul
      a abbr b bdi bdo cite code data dfn em i kbd mark q rp rt ruby
      s samp small span strong sub sup time u var
      audio map video
      iframe object picture portal
      svg math
      canvas noscript script
      del ins
      caption colgroup table tbody td tfoot th thead tr
      button datalist fieldset form label legend meter optgroup option
      output progress select textarea
      details dialog summary
      slot template
    ].freeze

    # https://developer.mozilla.org/en-US/docs/Glossary/Void_element
    VOID_TAG_NAMES = %i[
      area base br col embed hr img input link meta source track wbr
    ].freeze

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
        TAG_NAMES.each do |tag_name|
          def_tag tag_name
        end

        VOID_TAG_NAMES.each do |tag_name|
          def_void_tag tag_name
        end
      end
    end
  end
end
