#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rspec/autorun'

Dir['spec/**/*_spec.rb'].each { |f| require File.expand_path(f) }
