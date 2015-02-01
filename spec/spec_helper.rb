require 'simplecov'
SimpleCov.start

require 'slack'
require 'webmock/rspec'
require 'vcr'
WebMock.disable_net_connect!(allow_localhost: true)

module Helpers
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true

  config.order = 'random'
  config.include Helpers
end

VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = false
    c.default_cassette_options = { :record => :new_episodes }
    c.configure_rspec_metadata!
end

