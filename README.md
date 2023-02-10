# Ruht

Ruht generates HTML using Ruby language.
`ruht` stands for RUby Hyper Text or RUby HTml.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add ruht
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install ruht
```

## Usage

To generate HTML code right away you can use `Ruht.html` method.

```ruby
require 'ruht'

Ruht.html do
  doctype :html
  html lang: :en do
    head do
      meta charset: 'UTF-8'
      title { 'Document' }
    end

    body do
      ...
    end
  end
end
```

This code will produce this HTML (as a string):

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>
      Document
    </title>
  </head>
  <body>
    ...
  </body>
</html>
```

More examples can be found in [ruht-example repository][1].

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org][2].

### Running type checks in GitHub Actions

If you want to run Steep and RBS in CI add `[steep]` and `[rbs]` respectfully
to a commit message. You can run them locally using `bin/steep check` and
`bin/rbs`.

## Contributing

Bug reports and pull requests are welcome at [our GitHub repository][3].
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct][4].

## License

The gem is available as open source under the terms of the [MIT License][5].

## Code of Conduct

Everyone interacting in the Ruht project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct][4].

[1]: https://github.com/ruby-hyper-text/ruht-example
[2]: https://rubygems.org
[3]: https://github.com/ruby-hyper-text/ruht
[4]: https://github.com/ruby-hyper-text/ruht/blob/main/CODE_OF_CONDUCT.md
[5]: https://opensource.org/licenses/MIT
