# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashing/db/version'

Gem::Specification.new do |spec|
  spec.name          = "dashing-db"
  spec.version       = Dashing::Db::VERSION
  spec.authors       = ["Daniel Heath"]
  spec.email         = ["daniel@heath.cc"]
  spec.summary       = %q{Provides a sequel-backed database store for dashing history}
  spec.description   = %q{This makes it viable to deploy dashing with passenger.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sequel"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
