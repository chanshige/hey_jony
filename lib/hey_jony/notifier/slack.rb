# frozen_string_literal: true

require 'slack-notifier'

module HeyJony
  module Notifier
    class Slack
      @webhook_url = ''
      @channel = ''
      @username = ''
      @icon_emoji = ''

      # @param webhook_url<String>
      # @param channel<String>
      # @param username<String>
      # @param icon_emoji<String>
      # @return void
      def initialize(webhook_url, channel, username, icon_emoji)
        @webhook_url = webhook_url
        @channel = channel
        @username = username
        @icon_emoji = icon_emoji
      end

      # @param message<String>
      def post(message)
        notifier = ::Slack::Notifier.new @webhook_url, channel: @channel, icon_emoji: @icon_emoji, username: @username
        notifier.post text: message
      end
    end
  end
end
