# frozen_string_literal: true

require 'ruht/attributes/style_attribute'

RSpec.describe Ruht::Attributes::StyleAttribute do
  describe '#to_s' do
    context 'when given a string' do
      it 'returns it as is' do
        styles = described_class.new(:style, 'background: red; color: white;')

        expect(styles.to_s).to eq('style="background: red; color: white;"')
      end
    end

    context 'when given a hash' do
      it 'formats it as CSS' do
        styles = described_class.new(:style, background: :red, color: :white)

        expect(styles.to_s).to eq('style="background: red; color: white;"')
      end
    end
  end
end
