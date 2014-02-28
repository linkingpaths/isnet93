# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isnet93/version'

Gem::Specification.new do |spec|
  spec.name          = "isnet93"
  spec.version       = Isnet93::VERSION
  spec.authors       = ["Aitor García"]
  spec.email         = ["aitor@linkingpaths.com"]
  spec.summary       = %q{ISNET93 -> WGS84 coordinates conversion.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-autotest"
end
