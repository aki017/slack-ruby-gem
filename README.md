# Slack
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/aki017/slack-ruby-gem?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Gem Version](https://badge.fury.io/rb/slack-api.svg)](http://badge.fury.io/rb/slack-api)
[![Build Status](https://travis-ci.org/aki017/slack-ruby-gem.svg)](https://travis-ci.org/aki017/slack-ruby-gem)
[![Coverage Status](https://coveralls.io/repos/aki017/slack-ruby-gem/badge.svg)](https://coveralls.io/r/aki017/slack-ruby-gem)

A Ruby wrapper for the Slack API

## Installation

Add this line to your application's Gemfile:

    gem 'slack-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack-api

## Documentation
[http://www.rubydoc.info/gems/slack-api](http://www.rubydoc.info/gems/slack-api)

## Usage

```ruby
require "slack"

Slack.configure do |config|
  config.token = "YOUR_TOKEN"
end

Slack.auth_test
```

## Examples

[https://github.com/aki017/slack-ruby-gem/tree/dev/examples](https://github.com/aki017/slack-ruby-gem/tree/dev/examples)

## RTM

[Slack Bot Real Time Messaging API Integration in Ruby Tutorial](http://code.dblock.org/2015/04/28/slack-bot-real-time-messaging-api-integration-tutorial.html) thanks @dblock

## Contributing

1. Fork it ( http://github.com/aki017/slack-ruby-gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
