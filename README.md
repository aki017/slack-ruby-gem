# Slack

[![Gem Version](https://badge.fury.io/rb/slack-api.svg)](http://badge.fury.io/rb/slack-api)
[![Build Status](https://travis-ci.org/aki017/slack-ruby-gem.svg)](https://travis-ci.org/aki017/slack-ruby-gem)
[![Coverage Status](https://coveralls.io/repos/aki017/slack-ruby-gem/badge.svg)](https://coveralls.io/r/aki017/slack-ruby-gem)

A Ruby wrapper for the Slack [Web](https://api.slack.com/web) and [RealTime Messaging](https://api.slack.com/rtm) APIs.

## Installation

Add this line to your application's Gemfile:

    gem 'slack-api', require: 'slack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack-api

## Usage

### Create a New Bot Integration

This is something done in Slack, under [integrations](https://slack.com/services). Create a [new bot](https://artsy.slack.com/services/new/bot), and note its API token.

Use the token to verify auth.

```ruby
Slack.configure do |config|
  config.token = "YOUR_TOKEN"
end

auth = Slack.auth_test
fail auth['error'] unless auth['ok']
```

### Web API

The Slack Web API allows you to build applications that interact with Slack in more complex ways than the integrations we provide out of the box. For example, send messages with [chat_PostMessage](https://api.slack.com/methods/chat.postMessage).

```ruby
Slack.chat_postMessage(channel: 'general', text: 'Hello World')
```

### RealTime Messaging API

The Real Time Messaging API is a WebSocket-based API that allows you to receive events from Slack in real time and send messages as user.

```ruby
client = Slack.realtime

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  case data['text']
    when 'bot hi'
      Slack.chat_postMessage channel: data['channel'], text: "Hi <@#{data.user}>!"
    when /^bot/
      Slack.chat_postMessage channel: data['channel'], text: "Sorry <@#{data.user}>, what?"
    end
  end
end

client.start
```

You can send data to the RealTime API and invoke any of the [RTM methods](https://api.slack.com/rtm). The following simulates "typing".

```ruby
client.send_data({ type: 'typing', channel: 'general' }.to_json)
```

## Bot Servers

This gem provides access to low level Slack APIs. Consider using [slack-ruby-bot](https://github.com/dblock/slack-ruby-bot) for easier and higher level integration.

## Contributing

1. Fork it ( http://github.com/aki017/slack-ruby-gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
