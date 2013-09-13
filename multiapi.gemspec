# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multiapi/version'

Gem::Specification.new do |spec|
  spec.name          = "multiapi"
  spec.version       = Multiapi::VERSION
  spec.authors       = ["David Ramirez"]
  spec.email         = ["david@davidrv.com"]
  spec.description   = %q{Conect with multiple apis}
  spec.summary       = %q{Conect with multiple apis}
  spec.homepage      = "https://github.com/davidrv/multiapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
