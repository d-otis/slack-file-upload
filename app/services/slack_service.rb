class SlackService
  def initialize
    @slack_web_client = Slack::Web::Client.new
    @slack_web_client.auth_test
  rescue => e
    raise "#{e.class}/#{e.message}: Cannot authorize Slack with token. Check scope or token."
  end

  def send_message(msg, channel='#general') #i did not test this yet
    slack.chat_postMessage(channel: channel, text: msg, as_user: false, username: 'el user')
  end

  def send_csv
    output_string = CSV.generate('', headers: ['Name', 'Value'], write_headers: true) do |csv|
      csv << ['Foo', 0]
      csv << ['Bar', 1]
      csv << ['Baz', 2]
    end
    
    slack.files_upload(
      # file: Faraday::UploadIO.new(output_string, 'csv'),
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

  private 

  def slack # should this be self
    @slack_web_client
  end
end