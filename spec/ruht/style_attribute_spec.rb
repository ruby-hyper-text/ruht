# frozen_string_literal: true

require 'ruht/style_attribute'

RSpec.describe Ruht::StyleAttribute do
  describe '#to_s' do
    context 'when given a string' do
      it 'returns it as is' do
        styles = described_class.new('background: red; color: white;')

        expect(styles.to_s).to eq('background: red; color: white;')
      end
    end

    context 'when given a hash' do
      it 'formats it as CSS' do
        styles = described_class.new(background: :red, color: :white)

        expect(styles.to_s).to eq('background: red; color: white;')
      end
    end
  end
end
