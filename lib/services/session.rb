require 'faye/websocket'

class Session
  def initialize
    @slack = Slack.new
  end

  def run
    read_channel
  end

  def test_channel
    "chess-sam-kunal"
  end

  def send_message_to_channel(message, channel_id)
    websocket.send({ "id" => 1, "type" => "message", "channel" => channel_id, "text" => message }.to_json)
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

