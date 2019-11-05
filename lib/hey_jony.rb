# frozen_string_literal: true

require 'dotenv/load'
require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'

require_relative 'hey_jony/version'
require_relative 'hey_jony/notifier/slack'

# HeyJony
module HeyJony
  def self.run
    slack = HeyJony::Notifier::Slack.new ENV['SLACK_INCOMING_WEBHOOK_URL'], ENV['SLACK_CHANNEL'], ENV['SLACK_USERNAME'], ENV['SLACK_ICON_EMOJI']
    slack.post 'Welcome to jony bot cli!'

    # real time messaging api
    response = HTTP.post("https://slack.com/api/rtm.start", params: {token: ENV['SLACK_API_TOKEN']})
    url = JSON.parse(response.body)['url']

    EM.run do
      # JONY SERVER STAND BY!
      websocket = Faye::WebSocket::Client.new(url)

      websocket.on :open do
        p ":::::SUCCESS TO START JONY SERVER:::::"
      end
      
      websocket.on :message do |event|
        p ["EVENT::", JSON.parse(event.data)]
      end

      websocket.on :close do
        p "......JONY IS DEAD......"
        websocket = nil
        EM.stop
      end
    end
  end
end
