# frozen_string_literal: true

require "ruht/element"
require "ruht/attributes"

RSpec.describe Ruht::Element do
  let(:some_attributes) { Ruht::Attributes.new(id: "title-1", tabindex: 2) }

  describe "#to_s" do
    context "when given some attributes" do
      let(:element) { described_class.new(:section, some_attributes) }
      let(:expected_html) do
        <<~HTML.strip
          <section id="title-1" tabindex="2">
          </section>
        HTML
      end

      it "renders the element and its attributes" do
        expect(element.to_s).to eq(expected_html)
      end
    end

    context "when given a block using DSL" do
      let(:element) do
        described_class.new(:section, nil) do
          p do
            span
          end
        end
      end
      let(:expected_html) do
        <<~HTML.strip
          <section>
          <p>
          <span>
          </span>
          </p>
          </section>
        HTML
      end

      it "renders the children defined with the DSL" do
        expect(element.to_s).to eq(expected_html)
      end
    end

    context "when given a string as return value from the child block" do
      let(:element) { described_class.new(:section, nil) { "Hello" } }

      it "renders simple string if it is returned from the child block" do
        expect(element.to_s).to eq("<section>\nHello\n</section>")
      end
    end
  end

  describe "#render!" do
    let(:element) do
      another_element = described_class.new(:span, nil) { "test" }
      described_class.new(:section, nil) do
        render!(another_element)
      end
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

    it "allows to insert other elements" do
      expect(element.to_s).to eq(expected_html)
    end
  end
end
