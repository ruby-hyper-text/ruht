# frozen_string_literal: true

require 'ruht/document'

module Ruht
  # Entry point DSL for Ruht:
  # Ruht.html do
  #   doctype :html
  #   head { ... }
  # end
  #=>
  # <!DOCTYPE html>
  # ... etc
  # See Ruht::Document for details.
  def self.html(&block)
    Ruht::Document.new(&block).to_s
  end
end
