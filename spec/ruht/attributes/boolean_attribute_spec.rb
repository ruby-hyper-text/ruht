# frozen_string_literal: true

require 'ruht/attributes/boolean_attribute'

RSpec.describe Ruht::Attributes::BooleanAttribute do
  describe '#to_s' do
    let(:attribute) { described_class.new(:required) }

    it 'returns a string' do
      expect(attribute.to_s).to eq('required')
    end
  end
end
