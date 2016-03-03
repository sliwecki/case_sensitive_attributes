# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'case_sensitive_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = "case_sensitive_attributes"
  spec.version       = CaseSensitiveAttributes::VERSION
  spec.authors       = ["Damian Śliwecki"]
  spec.email         = ["sliwecki@gmail.com"]
  spec.summary       = spec.description = %q{Case sensitive for attributes}
  spec.homepage      = "https://github.com/sliwecki/case_sensitive_attributes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.1.0"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 2.5"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"
end
