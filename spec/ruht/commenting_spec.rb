# frozen_string_literal: true

RSpec.describe Ruht::Commenting do
  describe Ruht::Fragment do
    let(:fragment_with_comment) do
      described_class.new do
        p do
          comment 'the text below should receive updates every year'
          render!('Copyright (c) 2023')
        end
      end
    end
    let(:expected_html) do
      <<~HTML.strip
        <p>
          <!-- the text below should receive updates every year -->
          Copyright (c) 2023
        </p>
      HTML
    end

    it 'renders comments as well' do
      expect(fragment_with_comment.to_s).to eq(expected_html)
    end
  end
end
