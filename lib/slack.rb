require "slack/error"
require "slack/configuration"
require "slack/api"
require "slack/client"
require "slack/version"

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
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
