# frozen_string_literal: true

module Ruht
  # Enables HTML comments
  module Commenting
    def comment(string = nil, &block)
      comment_as_string = (string || instance_eval(&block)).to_s
      render!("<!-- #{comment_as_string} -->")
    end
  end
end
