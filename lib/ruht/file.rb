# frozen_string_literal: true

# Allows to render Ruby files
module Ruht
  def self.file(path = nil, &block)
    full_path = File.expand_path(path || block.call)
    html do
      instance_eval(File.read(full_path))
    end
  end
end
