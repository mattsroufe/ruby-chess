require 'net/http'
require 'json'
require 'faye/websocket'

class Slack
  TOKEN = "xoxp-19007494517-19011474082-19007915220-205475775d" # Kunal's token that works with the RTM
  # TOKEN = "xoxb-19012836615-WkvbEtky41yYHGvq7gsJY4nW" # Bots token but only works with the API not RTM

  def real_time_session
    api('rtm.start')
  end

  def join_channel(channel)
  end

  def game_channels
    channel_list.select do |channel|
      channel['name'].match(/\Achess\-/)
    end
  end

  def send_message(message, channel_name)
    api('chat.postMessage', {
      channel: find_channel_id(channel_name),
      text:    message,
    })
  end

  def find_channel_id(channel_name)
    game_channels.select { |channel| channel["name"] == channel_name }.first["id"]
  end

  private

  def channel_list
    data = api('channels.list')
    data["channels"].map do |channel|
      slice('id', 'name', channel)
    end
  end

  def slice(*keys, hash)
    keys.map.with_object({}) do |key, slice|
      slice[key] = hash[key]
    end
  end

  def api(resource, options = {})
    uri = URI("https://slack.com/api/#{resource}?#{params_for(options)}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def params_for(options)
    options.merge({token: TOKEN})
           .map { |k,v| "#{k}=#{v}" }
           .join('&')
  end
end

