require 'faye/websocket'

class Session
  def initialize
    @slack = Slack.new
  end

  def run
    message = "hello world"
    # @slack.send_message(message, test_channel)
    # send_message_to_channel(message, @slack.find_channel_id(test_channel))

    read_channel
    # while(true)

    # end
  end

  def test_channel
    "chess-sam-kunal"
  end

  def send_message_to_channel(message, channel_id)
    websocket.on :open do |event|
      websocket.send({ "id": 1, "type": "message", "channel": channel_id, "text": message }.to_json)
    end
  end

  def read_channel
    websocket.on :message do |event|
      p [:message, event.data]

      data = JSON.parse(event.data)
      if data["type"] == "message"
        message = "Parrot:" + data["text"]
        send_message_to_channel(message, @slack.find_channel_id(test_channel))
      end
    end
  end
 
  def talky
    websocket.on :message do |event|
      p [:message, event.data]
    end

    websocket.on :close do |event|
      p [:close, event.code, event.reason]
      reset
    end
  end

  private

  def websocket
    @websocket ||= Faye::WebSocket::Client.new(websocket_url)
  end

  def reset
    @websocket = nil
  end

  def websocket_url
    @slack.real_time_session["url"]
  end
end

