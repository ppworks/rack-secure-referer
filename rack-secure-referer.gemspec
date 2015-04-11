lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/secure/referer/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-secure-referer"
  spec.version       = Rack::Secure::Referer::VERSION
  spec.authors       = ["ppworks"]
  spec.email         = ["koshikawa@ppworks.jp"]
  spec.summary       = %q{Secure request.referer}
  spec.description   = %q{Secure request.referer for preventing XSS}
  spec.homepage      = "https://github.com/ppworks/rack-secure-referer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rack', '> 0.2'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
