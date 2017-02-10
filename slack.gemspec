# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "slack/version"

Gem::Specification.new do |spec|
  spec.name          = "slack-api"
  spec.version       = Slack::VERSION
  spec.authors       = ["aki017"]
  spec.email         = ["aki@aki017.info"]
  spec.summary       = %q{A Ruby wrapper for the Slack API}
  spec.description   = %q{A Ruby wrapper for the Slack API}
  spec.homepage      = "https://github.com/aki017/slack-ruby-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'erubis', '~> 2.7.0'
  spec.add_development_dependency "json-schema"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "faraday", "~> 0.11"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.10.0"
  spec.add_runtime_dependency "multi_json", ">= 1.0.3", "~> 1.0"
  spec.add_runtime_dependency "faye-websocket", "~> 0.10.6"
end
