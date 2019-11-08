# frozen_string_literal: true

require 'faraday'
require 'json'

module HeyJony
  module Experimental
    # Starts a Real Time Messaging session.
    class RtmConnect
      ENDPOINT = 'https://slack.com/api/rtm.connect'
      @request = nil

      def client
        Faraday.new
      end

      # Request
      def initialize(token)
        raise(Exception, 'token error') unless token.is_a? String

        @request = client.post(ENDPOINT, token: token, content_type: 'application/x-www-form-urlencoded')
      end

      # Return a WebSocket Message Server URL
      def get
        response = JSON.parse(@request.body, symbolize_names: true)
        response.key?(:url) ? response[:url] : raise(Exception, 'failed to get a wss url from slack api.')
      end
    end
  end
end
