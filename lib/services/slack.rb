require 'net/http'
require 'json'
require 'faye/websocket'

class Slack
  TOKEN = "xoxp-19007494517-19011474082-19007915220-205475775d" # Kunal's token that works with the RTM
  # TOKEN = "xoxb-19012836615-WkvbEtky41yYHGvq7gsJY4nW" # Bots token but only works with the API not RTM

  def real_time_session
    get('rtm.start')
  end

  def game_channels
    channel_list.select do |channel|
      channel['name'].match(/\Achess\-/)
    end
  end

  def send_message(message, channel_name)
    channel_id = find_channel_id(channel_name)
    resource = "chat.postMessage"
    args = "channel=#{channel_id}&text="+message
    api(resource, args)
  end

  def find_channel_id(channel_name)
    game_channels.select { |channel| channel["name"] == channel_name }.first["id"]
  end

  private

  def channel_list
    data = get('channels.list')
    data["channels"].map do |channel|
      slice('id', 'name', channel)
    end
  end

  def slice(*keys, hash)
    keys.map.with_object({}) do |key, slice|
      slice[key] = hash[key]
    end
  end

  def get(resource)
    uri = URI("https://slack.com/api/#{resource}?token=#{TOKEN}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def api(resource, args)
    uri = URI("https://slack.com/api/#{resource}?token=#{TOKEN}&"+args)
    Net::HTTP.get(uri)
  end
end

