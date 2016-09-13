require "slack"
require "yaml"

token = ENV["TOKEN"] || (print "Token: "; gets.strip)
client = Slack::Client.new token: token

# Get users list
puts "Get users list"
users = Hash[client.users_list["members"].map{|m| [m["id"], m["name"]]}]

puts YAML.dump users
puts
puts

# Get channels list
puts "Get channels list"
channels = client.channels_list["channels"]
puts YAML.dump channels
puts
puts

channels.each do |c|
  puts "- id: #{c["id"]}, name: #{c["name"]}"

  # Get channel history
  messages = client.channels_history(channel: "#{c["id"]}")["messages"]
  messages.each do |message|
    user_name = users[message["user"]]
    text = message["text"].inspect
    puts "  - #{user_name}: #{text}"
  end
end

sleep 1

