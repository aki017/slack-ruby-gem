require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '.bundle/'
end

require 'slack'
require 'webmock/rspec'
require 'vcr'
WebMock.disable_net_connect!(allow_localhost: true)

# this helper is not good
module Helpers
  def valid_token
    $stderr.puts "Please set valid_token to ENV['TOKEN']" if ENV['TOKEN'].nil?
    @token ||= ENV['TOKEN'] || (print "Token: "; gets.strip)
  end

  def valid_client
    @valid_client ||= Slack::Client.new(token: valid_token)
  end

  def invalid_token
    "dummy_token"
  end

  def invalid_client
    @invalid_client ||= Slack::Client.new(token: invalid_token)
  end

  def test_user_id
    @test_user_id ||= valid_client.auth_test["user_id"]
  end

  def test_user_name
    @test_user_name ||= valid_client.auth_test["user"]
  end

  def another_user_name
    @another_user_name ||= "aki017"
  end


  def another_user_id
    @another_user_id ||= "U0399SL90" #valid_client.
  end

  def test_channel_name
    @ntest_channel_name ||= "gem_testroom"
  end

  def test_channel_id
    @test_channel_id ||= "C04NL1FKT"
  end

  def another_channel_name
    @another_channel_name ||= "gem_testroom2"
  end

  def valid_response
    include({ "ok" => true })
  end
end

include Helpers
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.order = 'random'
  config.include Helpers
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = { :record => :new_episodes }
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<TOKEN>") { valid_token }
end
