# frozen_string_literal: true

require 'ruht/document'
module Ruht
  # Entry point DSL for Ruht:
  # Ruht.html do
  #   doctype :html
  #   head { ... }
  # end
  module Html
    def self.html(&block)
      Ruht::Document.new(&block).to_s
    end
  end
end
