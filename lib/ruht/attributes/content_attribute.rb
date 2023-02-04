# frozen_string_literal: true

module Ruht
  class Attributes
    # Generic attributes formatter
    class ContentAttribute
      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s
        format('%<name>s="%<value>s"', name: name, value: value)
      end

      protected

      attr_reader :name, :value
    end
  end
end
