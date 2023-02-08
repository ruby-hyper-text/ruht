# frozen_string_literal: true

require 'ruht/attributes/content_attribute'

RSpec.describe Ruht::Attributes::ContentAttribute do
  describe '#to_s' do
    let(:attribute) { described_class.new(:href, 'example.org') }

    it 'wraps value with double quotes' do
      expect(attribute.to_s).to eq('href="example.org"')
    end
  end
end
