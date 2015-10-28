require_relative "slack/error"
require_relative "slack/configuration"
require_relative "slack/api"
require_relative "slack/client"
require_relative "slack/version"

module Slack
  extend Configuration

  # Alias for Slack::Client.new
  #
  # @return [Slack::Client]
  def self.client(options={})
    Slack::Client.new(options)
  end

  # Delegate to Slack::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Slack::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
