# frozen_string_literal: true

RSpec.describe Ruht, '.html' do
  subject(:html) do
    described_class.html do
      html do
        p { message }
      end
    end
  end

  let(:message) { 'hello' }
  let(:expected_html) do
    <<~HTML.strip
      <html>
        <p>
          hello
        </p>
      </html>
    HTML
  end

  it 'renders HTML to string' do
    expect(html).to eq(expected_html)
  end
end
