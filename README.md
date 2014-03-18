# Slack

A Ruby wrapper for the Slack API

## Installation

Add this line to your application's Gemfile:

    gem 'slack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack

## Usage

```ruby
require "slack"

Slack.configure do |config|
  config.token = "YOUR_TOKEN"
end

Slack.auth_test
```

## Contributing

1. Fork it ( http://github.com/aki017/slack-ruby-gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
