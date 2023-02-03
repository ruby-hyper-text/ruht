# frozen_string_literal: true

require 'ruht/data_attributes'

RSpec.describe Ruht::DataAttributes do
  let(:data_attributes) { described_class.new(behavior: :delete, key: 3) }

  describe '#to_s' do
    it 'creates data attributes from hash' do
      expect(data_attributes.to_s).to eq('data-behavior="delete" data-key="3"')
    end

    context 'when given a single attribute' do
      let(:data_attributes) { described_class.new(key: 3) }

      it 'formats it with no extra spaces' do
        expect(data_attributes.to_s).to eq('data-key="3"')
      end
    end

    context 'when given an empty hash' do
      let(:data_attributes) { described_class.new({}) }

      it 'returns an empty string' do
        expect(data_attributes.to_s).to eq('')
      end
    end
  end
end
