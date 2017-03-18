require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require File.expand_path('../configuration', __FILE__)
require File.expand_path('../endpoint', __FILE__)
require File.expand_path('../realtime/client', __FILE__)

module Slack
  # @private
  class API
    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    # Creates a new API
    def initialize(options={})
      options = Slack.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
    include Endpoint

    def realtime
      RealTime::Client.new(post("rtm.start"))
    end
  end
end
