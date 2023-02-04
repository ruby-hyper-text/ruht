# frozen_string_literal: true

require 'ruht/fragment'

RSpec.describe Ruht::Fragment do
  describe '#to_s' do
    pending '# TODO'
  end

  describe '#render!' do
    let(:fragment) do
      # TODO: fix passing the context
      inner = inner_fragment
      described_class.new do
        p do
          render! 'Given some text'
          render! inner
        end
      end
    end
    let(:inner_fragment) do
      described_class.new do
        span do
          'Given another fragment'
        end
      end
    end
    let(:expected_html) do
      <<~HTML.strip
        <p>
        Given some text
        <span>
        Given another fragment
        </span>
        </p>
      HTML
    end

    it 'can render other fragments inside' do
      expect(fragment.to_s).to eq(expected_html)
    end
  end
end
