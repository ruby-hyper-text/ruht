# frozen_string_literal: true

require "date"

require "ruht/document"

RSpec.describe Ruht::Document do
  subject(:document) do
    current_time = DateTime.parse("2023-01-28 11:57")
    time_element = described_class.new do
      time datetime: current_time.iso8601 do
        current_time.asctime
      end
    end
    described_class.new do
      doctype :html
      html do
        body do
          main do
            p style: { color: :grey } do
              render!(time_element)
            end
          end
        end
      end
    end
  end

  describe "#to_s" do
    let(:html_including_fragment) do
      <<~HTML.strip
        <!DOCTYPE html>
        <html>
        <body>
        <main>
        <p style="color: grey;">
        <time datetime="2023-01-28T11:57:00+00:00">
        Sat Jan 28 11:57:00 2023
        </time>
        </p>
        </main>
        </body>
        </html>
      HTML
    end

    it "renders fragments" do
      expect(document.to_s).to eq(html_including_fragment)
    end
  end
end
