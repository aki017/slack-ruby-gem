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
  spec.add_development_dependency "rspec", "~> 2.4"
  spec.add_development_dependency "webmock", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'erubis', '~> 2.7.0'
  spec.add_development_dependency "json-schema"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "faraday", [">= 0.7", "<= 0.9.9"]
  spec.add_runtime_dependency "faraday_middleware", "~> 0.8"
  spec.add_runtime_dependency "multi_json", ">= 1.0.3", "~> 1.0"
  spec.add_runtime_dependency "faye-websocket", "~> 0.9.2"
end
