# frozen_string_literal: true

module Ruht
  # Formats HTML class attribute value
  class ClassAttribute
    def initialize(class_list)
      @class_list = class_list
    end

    def to_s
      return @class_list if @class_list.is_a?(String)

      @class_list.join(" ")
    end
  end
end
