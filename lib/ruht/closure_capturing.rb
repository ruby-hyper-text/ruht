# frozen_string_literal: true

module Ruht
  # Delegates method calls to the object who created the given block.
  module ClosureCapturing
    def initialize(context)
      @context = context
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless respond_to_missing?(method_name)

      @context.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_all = false)
      @context.respond_to?(method_name.to_sym, include_all)
    end
  end
end
