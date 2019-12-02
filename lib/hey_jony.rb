# frozen_string_literal: true

require 'thor'
require 'hey_jony/version'
require 'hey_jony/notifier/slack'
require 'hey_jony/experimental/rtm_connect'
require 'hey_jony/life'

module HeyJony
  class Cli < Thor
    desc 'notify [message]', 'post message to slack.'
    # @param msg<String>
    # @return void
    def notify(msg = 'Welcome to jony bot cli!')
      slack = HeyJony::Notifier::Slack.new ENV['SLACK_INCOMING_WEBHOOK_URL'],
                                           ENV['SLACK_CHANNEL'],
                                           ENV['SLACK_USERNAME'],
                                           ENV['SLACK_ICON_EMOJI']
      slack.post msg
    end

    desc 'talk', 'Start a real time jony talk on slack.'
    # @return void
    def talk
      conn = HeyJony::Experimental::RtmConnect.new ENV['SLACK_API_TOKEN']
      HeyJony::Life.talk conn.wss_url
    rescue StandardError => e
      p '[error] ' + e.message
    end
  end
end
