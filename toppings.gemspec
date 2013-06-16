# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toppings/version'

Gem::Specification.new do |spec|
  spec.name        = "toppings"
  spec.version     = Toppings::VERSION
  spec.authors     = ["Falk Hoppe, Roman Stranghöner"]
  spec.email       = ["falkhoppe81@gmail.com"]
  spec.description = %q{css frontend framework based on sass/scss}
  spec.summary     = %q{css frontend framework based on sass/scss}
  # spec.homepage      = ""
  spec.license     = "MIT"

  spec.files = %w(LICENSE.txt README.md toppings.gemspec)
  spec.files += Dir.glob("bin/**/*")
  spec.files += Dir.glob("lib/**/*.rb")

  spec.executables               = %w{topping}
  spec.test_files                = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths             = ["lib"]
  spec.required_rubygems_version = '>= 1.3.6'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "thor"

  spec.add_dependency "thor", ">= 0.18.1"
  spec.add_dependency "activesupport", ">= 3.2"
  spec.add_dependency "compass", ">= 0.12.2"
  spec.add_dependency "susy", ">= 1.0.8"
end
