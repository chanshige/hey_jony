# frozen_string_literal: true

require 'dotenv/load'
require 'thor'

require 'hey_jony/version'
require 'hey_jony/notifier/slack'
require 'hey_jony/life'

module HeyJony
  class Cli < Thor
    desc 'to_slack [message]', 'post message.'
    # @param msg<String>
    def to_slack(msg = 'Welcome to jony bot cli!')
      slack = HeyJony::Notifier::Slack.new ENV['SLACK_INCOMING_WEBHOOK_URL'],
                                           ENV['SLACK_CHANNEL'],
                                           ENV['SLACK_USERNAME'],
                                           ENV['SLACK_ICON_EMOJI']
      slack.post msg
    end

    desc 'rtm', 'Starts a Real Time Jony.'
    # @return void
    def rtm
      life = HeyJony::Life.new HeyJony::Experimental::RtmConnect.new ENV['SLACK_API_TOKEN']
      life.exec
    rescue StandardError => e
      p '[error] ' + e.message
    end
  end
end
