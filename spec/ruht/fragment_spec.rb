# frozen_string_literal: true

require 'ruht/fragment'

RSpec.describe Ruht::Fragment do
  describe '#to_s' do
    let(:fragment) do
      described_class.new do
        input
        button { :click }
      end
    end
    let(:expected_html) do
      <<~HTML.strip
        <input>
        <button>
          click
        </button>
      HTML
    end

    it 'renders some blocks' do
      expect(fragment.to_s).to eq(expected_html)
    end
  end

  describe '#render!' do
    let(:fragment) do
      described_class.new do
        p do
          render! 'Given some text'
          render! inner_fragment
        end
      end
    end
    let(:inner_fragment) do
      described_class.new do
        span do
          'Given another fragment'
        end
      end
    end
    let(:expected_html) do
      <<~HTML.strip
        <p>
          Given some text
          <span>
            Given another fragment
          </span>
        </p>
      HTML
    end

    it 'can render other fragments inside' do
      expect(fragment.to_s).to eq(expected_html)
    end

    context 'with other fragments defined in a different scope' do
      let(:fragment) do
        require 'fixtures/another_fragment'

        described_class.new do
          p do
            render! 'Given some text'
            render! another_fragment
          end
        end
      end

      it 'can render other fragments inside' do
        expect(fragment.to_s).to eq(expected_html)
      end
    end
  end

  describe 'basic elements' do
    let(:fragment) do
      described_class.new do
        head do
          title { :page }
          meta charset: 'UTF-8'
          link rel: :stylesheet, src: 'styles.css'
          script :async, src: 'script.js'
          script do
            <<~JS
              let message = 'hello';
              alert(message);
            JS
          end
          style do
            <<~CSS
              body {
                margin: 0;
              }
            CSS
          end
        end

        body do
          header do
            b { 'hello' }
          end
          nav do
            ol do
              3.times.map do |item_content|
                li { item_content }
              end
            end
          end

          main do
            article do
              h1 { 'test' }
              section do
                p { 'the end' }
              end
              table do
                tr do
                  3.times.map do |index|
                    td { index }
                  end
                end
              end
            end
          end
          aside do
            div { 'hello from aside' }
          end

          footer do
            i { 'bye' }
          end
        end
      end
    end

    let(:expected_html) do
      <<~HTML.strip
        <head>
          <title>
            page
          </title>
          <meta charset="UTF-8">
          <link rel="stylesheet" src="styles.css">
          <script async src="script.js"></script>
          <script>
            let message = 'hello';
            alert(message);
          </script>
          <style>
            body {
              margin: 0;
            }
          </style>
        </head>
        <body>
          <header>
            <b>
              hello
            </b>
          </header>
          <nav>
            <ol>
              <li>
                0
              </li>
              <li>
                1
              </li>
              <li>
                2
              </li>
            </ol>
          </nav>
          <main>
            <article>
              <h1>
                test
              </h1>
              <section>
                <p>
                  the end
                </p>
              </section>
              <table>
                <tr>
                  <td>
                    0
                  </td>
                  <td>
                    1
                  </td>
                  <td>
                    2
                  </td>
                </tr>
              </table>
            </article>
          </main>
          <aside>
            <div>
              hello from aside
            </div>
          </aside>
          <footer>
            <i>
              bye
            </i>
          </footer>
        </body>
      HTML
    end

    it 'supports basic elements' do
      expect(fragment.to_s).to eq(expected_html)
    end
  end
end
