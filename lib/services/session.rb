require 'faye/websocket'

class Session
  def initialize
    @slack = Slack.new
  end

  def run
    websocket.on :open do |event|
      #join_test_channel

      print_welcome_message

      listen_for_game_commands
    end
  end

  def join_test_channel
    @slack.websocket
  end

  def print_welcome_message
    @slack.send_message("Hello samu", test_channel)
  end

  def test_channel
    # "chess-sam-kunal"
    "chess-matthew-samu"
  end

  def send_message_to_channel(message, channel_id)
    command = {
      "id":      1,
      "type":    "message",
      "channel": channel_id,
      "text":    message
    }
    websocket.send(command.to_json)
  end

  def listen_for_game_commands
    websocket.on :message do |event|
      p [:message, event.data]
      #data = JSON.parse(event.data)
      #message = "Parrot:" + data["text"]
      #send_message_to_channel(message, @slack.find_channel_id(test_channel))
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

