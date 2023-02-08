# frozen_string_literal: true

require 'ruht/fragment'

def another_fragment
  Ruht::Fragment.new do
    span do
      'Given another fragment'
    end
  end
end
