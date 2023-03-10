# frozen_string_literal: true

require 'ruht/attributes'
require 'ruht/element'

RSpec.describe Ruht::Element do
  let(:some_attributes) { Ruht::Attributes.new(id: 'title-1', tabindex: 2) }

  describe '#to_s' do
    context 'when given some attributes' do
      let(:element) { described_class.new(:section, some_attributes) { :test } }
      let(:expected_html) do
        <<~HTML.strip
          <section id="title-1" tabindex="2">
            test
          </section>
        HTML
      end

      it 'renders the element and its attributes' do
        expect(element.to_s).to eq(expected_html)
      end
    end

    context 'when given a block using DSL' do
      let(:element) do
        described_class.new(:section, nil) do
          p do
            span { :test }
          end
        end
      end
      let(:expected_html) do
        <<~HTML.strip
          <section>
            <p>
              <span>
                test
              </span>
            </p>
          </section>
        HTML
      end

      it 'renders the children defined with the DSL' do
        expect(element.to_s).to eq(expected_html)
      end
    end

    context 'when given a string as return value from the child block' do
      let(:element) { described_class.new(:section, nil) { 'Hello' } }
      let(:expected_html) do
        <<~HTML.strip
          <section>
            Hello
          </section>
        HTML
      end

      it 'renders simple string if it is returned from the child block' do
        expect(element.to_s).to eq(expected_html)
      end
    end

    context 'when given no children' do
      let(:element) { described_class.new(:section, some_attributes) }

      it 'renders the element in one line' do
        expect(element.to_s).to eq(
          '<section id="title-1" tabindex="2"></section>'
        )
      end
    end
  end

  describe '#render!' do
    let(:element) do
      described_class.new(:section, nil) do
        render!(another_element)
      end
    end
    let(:another_element) do
      described_class.new(:span, nil) { 'test' }
    end
    let(:expected_html) do
      <<~HTML.strip
        <section>
          <span>
            test
          </span>
        </section>
      HTML
    end

    it 'allows to insert other elements' do
      expect(element.to_s).to eq(expected_html)
    end
  end
end
