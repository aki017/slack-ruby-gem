# Slack

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

See [CONTRIBUTING](CONTRIBUTING.md).

## License

Copyright (c) 2014 aki017

MIT License, see [LICENSE](LICENSE.txt) for details.
