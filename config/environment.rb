require 'bundler/setup'
Bundler.require

require 'rake'
require 'dotenv/load'

require_all './app'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end