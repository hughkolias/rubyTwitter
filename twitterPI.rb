require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
 config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
  config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
  config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
  config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
end

# client = Twitter::Streaming::Client.new do |config|
#   config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
#   config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
#   config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
#   config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
# end

print client.user.name