class SlackService
  def initialize
    @slack_web_client = Slack::Web::Client.new
    @slack_web_client.auth_test
  rescue => e
    raise "#{e.class}/#{e.message}: Cannot authorize Slack with token. Check scope or token."
  end

  def send_message(msg, channel='#general') #i did not test this yet
    slack.chat_postMessage(channel: channel, text: msg, username: 'el user')
  end

  private 

  def slack # should this be self
    @slack_web_client
  end
end