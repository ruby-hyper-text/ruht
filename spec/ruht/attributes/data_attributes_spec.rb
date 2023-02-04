# frozen_string_literal: true

require 'ruht/attributes/data_attributes'

RSpec.describe Ruht::Attributes::DataAttributes do
  let(:data_attributes) do
    described_class.new(:data, behavior: :delete, key: 3)
  end

  describe '#to_s' do
    it 'creates data attributes from hash' do
      expect(data_attributes.to_s).to eq('data-behavior="delete" data-key="3"')
    end

    context 'when given a single attribute' do
      let(:data_attributes) { described_class.new(:data, key: 3) }

      it 'formats it with no extra spaces' do
        expect(data_attributes.to_s).to eq('data-key="3"')
      end
    end

    context 'when given an empty hash' do
      let(:data_attributes) { described_class.new(:data, {}) }

      it 'returns an empty string' do
        expect(data_attributes.to_s).to eq('')
      end
    end
  end
end
