# frozen_string_literal: true

require 'dotenv/load'
require 'hey_jony/version'
require 'hey_jony/notifier/slack'
require 'hey_jony/life'

# HeyJony
module HeyJony
  def self.run
    life = HeyJony::Life.new HeyJony::Experimental::RtmConnect.new 222
    life.exec
  rescue StandardError => e
    p '[error] ' + e.message
  end
end
