# frozen_string_literal: true

require_relative 'lib/ruht/version'

Gem::Specification.new do |spec|
  spec.name = 'ruht'
  spec.version = Ruht::VERSION
  spec.authors = ['Dmitry Barskov']
  spec.email = ['dmitry.barskov64@gmail.com']

  spec.summary = 'DSL for building HTML written in Ruby'
  spec.description = 'Ruht lets you generate HTML using Ruby syntax'
  spec.homepage = 'https://github.com/ruby-hyper-text/ruht'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['github_repo'] = 'ssh://github.com/ruby-hyper-text/ruht'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|spec)/|\.(?:git|github))})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
