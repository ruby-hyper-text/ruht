# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rake', '~> 13.0'

group :development do
  gem 'rubocop', '~> 1.49.0', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false

  gem 'steep', require: false
  gem 'typeprof', require: false
end

group :test do
  gem 'rspec', '~> 3.0'
end

group :development, :test do
  gem 'byebug'
end
