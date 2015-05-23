require 'faye/websocket'
require 'eventmachine'

module Slack
  module RealTime
    class Client
      def initialize(url)
        @url = url
        @callbacks ||= {}
      end

      def on(type, &block)
        @callbacks[type] ||= []
        @callbacks[type] << block
      end

      def start
        EM.run do
          ws = Faye::WebSocket::Client.new(@url)

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
            EM.stop
          end
        end
      end
    end
  end
end
