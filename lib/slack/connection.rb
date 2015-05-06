require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Slack
  # @private
  module Connection
    private

    def connection
      options = {
        :headers => {'Accept' => "application/json; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :url => endpoint,
        :ssl => { :ca_path => ca_path, :ca_file => ca_file },
      }

      Faraday::Connection.new(options) do |connection|
        Array(middlewares).each do |middleware|
          connection.use middleware
        end
        connection.use Faraday::Request::Multipart
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::ParseJson
        connection.use FaradayMiddleware::RaiseHttpException
        connection.adapter(adapter)
      end
    end
  end
end
