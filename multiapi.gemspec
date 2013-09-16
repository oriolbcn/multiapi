# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'multiapi/version'

Gem::Specification.new do |spec|
  spec.name          = "multiapi"
  spec.version       = Multiapi::VERSION
  spec.authors       = ["David Ramirez"]
  spec.email         = ["david@davidrv.com"]
  spec.description   = %q{Conect with multiple apis}
  spec.summary       = %q{Conect with multiple apis for Omby project}
  spec.homepage      = "https://github.com/davidrv/multiapi"
  spec.license       = "MIT"
  
  spec.add_dependency 'addressable'
  spec.add_dependency 'multi_json'
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency("rspec", "~> 2.14.0")
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency("webmock", "~> 1.13.0")
  
  spec.files         = Dir.glob('{lib}/**/*') + %w[LICENSE.txt README.md]
  spec.require_paths = ["lib"]
  
end
