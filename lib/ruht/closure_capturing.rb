# frozen_string_literal: true

module Ruht
  # Delegates method calls to the object who created the given block.
  module ClosureCapturing
    def initialize(closure)
      @closure = closure.is_a?(Proc) ? closure&.binding : closure
    end

    private

    def closure_context
      @closure&.receiver
    end

    def method_missing(method_name, *args, &block)
      return super unless respond_to_missing?(method_name, *args, &block)

      closure_context.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, *args)
      return false unless @child_block

      closure_context.respond_to?(method_name, *args)
    end
  end
end
