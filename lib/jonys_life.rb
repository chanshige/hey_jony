require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'

# JonysLife
module JonysLife
  def self.run
    # real time messaging api
    response = HTTP.post("https://slack.com/api/rtm.start", params: {token: ENV['SLACK_API_TOKEN']})
    url = JSON.parse(response.body)['url']

    EM.run do
      # JONY SERVER STAND BY!
      websocket = Faye::WebSocket::Client.new(url)

      websocket.on :open do
        p "~~~~~~~~JONY IS BORN~~~~~~~~"
      end

      websocket.on :message do |event|
        event_data = JSON.parse(event.data)
        p ["EVENT::", event_data]

        if !event_data['text'].nil?
          # jony checks his name ANYTIME ANYWHERE
          if event_data['text'].include?('ジョニー')
            slack.post '呼んだ？'
          end
        end
      end

      websocket.on :close do
        p "......JONY IS DEAD......"
        websocket = nil
        EM.stop
      end
    end
  end
end