# frozen_string_literal: true

# Allows to render Ruby files
module Ruht
  def self.file(path)
    full_path = File.expand_path(path)
    html do
      instance_eval(File.read(full_path))
    end
  end
end
