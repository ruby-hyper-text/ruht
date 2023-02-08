# frozen_string_literal: true

require 'ruht/attributes'

RSpec.describe Ruht::Attributes do
  describe '#to_s' do
    subject(:html) { described_class.new(**attributes).to_s }

    describe 'boolean attributes format' do
      subject(:html) { described_class.new(:required, :disabled).to_s }

      it 'renders them with no values provided' do
        expect(html).to eq('required disabled')
      end

      it 'renders them with their names as values', pending: 'another option' do
        expect(html).to eq('required="required" disabled="disabled"')
      end
    end

    describe 'content attributes format' do
      let(:attributes) { { action: '/forms', disabled: false } }

      it 'renders them with double quotes' do
        expect(html).to eq('action="/forms" disabled="false"')
      end
    end

    context 'with style attribute' do
      let(:attributes) { { style: { background: :red, 'z-index': 2 } } }

      it 'renders it as CSS' do
        expect(html).to eq('style="background: red; z-index: 2;"')
      end
    end

    context 'with data attribute' do
      let(:attributes) { { data: { id: 1, 'loading-behavior': :spinner } } }

      it 'renders it as separate attributes' do
        expect(html).to eq('data-id="1" data-loading-behavior="spinner"')
      end
    end

    context 'with class tag as array' do
      let(:attributes) { { class: %w[accordion-trigger fieldset] } }

      it 'renders it as separate attributes' do
        expect(html).to eq('class="accordion-trigger fieldset"')
      end
    end
  end
end
