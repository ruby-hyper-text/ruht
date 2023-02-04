# frozen_string_literal: true

require 'ruht/attributes/class_attribute'

RSpec.describe Ruht::Attributes::ClassAttribute do
  describe '#to_s' do
    context 'when given a list' do
      let(:attribute) { described_class.new(:class, %i[border link]) }

      it 'returns a class list' do
        expect(attribute.to_s).to eq('class="border link"')
      end
    end

    context 'when given a string' do
      let(:attribute) { described_class.new(:class, 'underlined') }

      it 'returns it as is' do
        expect(attribute.to_s).to eq('class="underlined"')
      end
    end
  end
end
