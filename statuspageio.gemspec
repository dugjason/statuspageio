# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statuspageio/version'

Gem::Specification.new do |spec|
  spec.name          = "statuspageio"
  spec.version       = Statuspageio::VERSION
  spec.authors       = ["Jason Dugdale"]
  spec.email         = ["jason.dugdale@gmail.com"]

  spec.summary       = %q{Simple Ruby wrapper around the StatusPage.io API}
  spec.homepage      = "https://github.com/dugjason/statuspageio"
  spec.license       = "MIT"

  spec.files         = %w(CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md statuspageio.gemspec) + Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
end
