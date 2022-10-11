class SlackService
  def initialize
    @slack_web_client = Slack::Web::Client.new
    @slack_web_client.auth_test
  rescue => e
    raise "#{e.class}/#{e.message}: Cannot authorize Slack with token. Check scope or token."
  end
end