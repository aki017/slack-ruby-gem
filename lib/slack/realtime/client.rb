require 'faye/websocket'
require 'eventmachine'

module Slack
  module RealTime
    class Client
      def initialize(rtm_start_response)
        @response = rtm_start_response
        @url = rtm_start_response["url"]
        @callbacks ||= {}
      end

      def on(type, &block)
        @callbacks[type] ||= []
        @callbacks[type] << block
      end

      def start
        EM.run do
          ws = Faye::WebSocket::Client.new(@url, nil, ping: 30)

          ws.on :open do |event|
          end

          ws.on :message do |event|
            data = JSON.parse(event.data)
            if !data["type"].nil? && !@callbacks[data["type"].to_sym].nil?
              @callbacks[data["type"].to_sym].each do |c|
                c.call data
              end
            end
          end

          ws.on :close do |event|
            @callbacks[:close].each { |c| c.call } unless @callbacks[:close].nil?
            EM.stop
          end
        end
      end

      def method_missing(method, *args, &block)
        return super if @response[method.to_s].nil?
        @response[method.to_s]
      end

      # Delegate to Slack::Client
      def respond_to?(method, include_all=false)
        return !@response[method.to_s].nil? || super
      end
    end
  end
end
