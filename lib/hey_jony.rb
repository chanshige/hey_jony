# frozen_string_literal: true

require 'dotenv/load'

require 'hey_jony/version'
require 'hey_jony/notifier/slack'

# HeyJony
module HeyJony
  def self.run
    slack = HeyJony::Notifier::Slack.new ENV['SLACK_INCOMING_WEBHOOK_URL'],
                                         ENV['SLACK_CHANNEL'],
                                         ENV['SLACK_USERNAME'],
                                         ENV['SLACK_ICON_EMOJI']

    slack.post 'Welcome to jony bot cli!'
  end
end
