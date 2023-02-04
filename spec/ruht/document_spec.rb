# frozen_string_literal: true

require 'date'

require 'ruht/document'

RSpec.describe Ruht::Document do
  subject(:document) do
    described_class.new do
      doctype :html
      html do
        body do
          main do
            p style: { color: :grey } do
              'Hello world'
            end
          end
        end
      end
    end
  end

  describe '#to_s' do
    let(:html_including_fragment) do
      <<~HTML.strip
        <!DOCTYPE html>
        <html>
        <body>
        <main>
        <p style="color: grey;">
        Hello world
        </p>
        </main>
        </body>
        </html>
      HTML
    end

    it 'renders document' do
      expect(document.to_s).to eq(html_including_fragment)
    end
  end
end
