# frozen_string_literal: true

require 'json'
require 'eventmachine'
require 'faye/websocket'

module HeyJony
  class Life
    def self.talk(wss_url)
      EM.run do
        # JONY SERVER STAND BY!
        ws = Faye::WebSocket::Client.new wss_url

        ws.on :open do
          p '~~~~~~~~JONY IS BORN~~~~~~~~'
        end

        ws.on :message do |event|
          data = JSON.parse(event.data, symbolize_names: true)
          p [:message, data]

          unless data[:text].nil?
            # jony checks his name ANYTIME ANYWHERE
            message = { id: Time.now.strftime('%Y%m%d%H%M%S'),
                        type: 'message',
                        channel: data[:channel],
                        text: '呼んだ？' }

            ws.send(JSON.generate(message)) if data[:text].include?('ジョニー')
          end
        end

        ws.on :close do
          p '......JONY IS DEAD......'
          EM.stop
        end
      end
    end
  end
end
