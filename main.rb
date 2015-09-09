require "logger"
require "slack"

logger = Logger.new("./swigger.log")

Slack.configure do |config|
  config.token = ENV["SLACK_OAUTH_TOKEN"]
end

dj_swig = Slack.channels_list["channels"].find { |c| c["name"] == "dj_s-wig" }
logger.info("found channel dj_swig: #{dj_swig}")

loop do
  logger.info Slack.channels_archive(channel: dj_swig["id"])
  sleep(5)
end

