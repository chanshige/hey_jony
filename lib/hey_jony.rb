# frozen_string_literal: true

require 'dotenv/load'
require 'thor'

require 'hey_jony/version'
require 'hey_jony/notifier/slack'

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
  end
end
