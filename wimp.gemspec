# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wimp/version"

Gem::Specification.new do |spec|
  spec.name          = "wimp"
  spec.version       = Wimp::VERSION
  spec.authors       = ["Linus Oleander"]
  spec.email         = ["linus@oleander.nu"]
  spec.summary       = %q{Ruby bindings for WiMP}
  spec.homepage      = "https://github.com/oleander/wimp-api-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "thrift"
  spec.add_dependency "rack"
  spec.add_dependency "thin"
  
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock", "1.8.0"
end