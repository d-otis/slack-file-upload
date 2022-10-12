class SlackService
  def initialize
    @slack_web_client = Slack::Web::Client.new
    @slack_web_client.auth_test
  rescue => e
    raise "#{e.class}/#{e.message}: Cannot authorize Slack with token. Check scope or token."
  end

  def send_message(msg, channel='#general')
    slack.chat_postMessage(channel: channel, text: msg, as_user: true)
  end

  def send_csv
    output_string = CSV.generate('', headers: ['Name', 'Value'], write_headers: true) do |csv|
      csv << ['Foo', 0]
      csv << ['Bar', 1]
      csv << ['Baz', 2]
    end

    slack.files_upload( # needs 'files:write' scope https://api.slack.com/methods/files.upload
      content: output_string,
      channels: '#general',
      as_user: true,
      title: 'cool csv',
      filename: 'cool.csv',
      initial_comment: 'This is initial comment',
      token: ENV['FILE_UPLOAD_TOKEN'],
      filetype: 'csv'
    )
  end

  def query_user
    slack.users_info(user: '@dan') # this appears to return similar as below
    slack.users_lookupByEmail(email: 'dan@example.com') # needs 'users:read.email' scope
  end

  private 

  def slack
    @slack_web_client
  end
end