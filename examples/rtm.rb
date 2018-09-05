require "slack"
require "yaml"

token = ENV["TOKEN"] || (print "Token: "; gets.strip)
client = Slack::Client.new token: token

#rtm = client.realtime
client.realtime.on :message do |m|
  p m
end
client.realtime.start

rtm = client.realtime
rtm.on :message do |m|
  p m
end
rtm.start
