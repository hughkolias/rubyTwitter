require 'rubygems' 
require 'twitter'
require 'chartkick'

rest_client = Twitter::REST::Client.new do |config|
 config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
  config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
  config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
  config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
end

stream_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
  config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
  config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
  config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
end

i = 0

stream_client.filter(locations: "-79.399837,43.657540,-79.381129,43.679445") do |tweet|
   puts "#{tweet.user.name} says: #{tweet.text}" if tweet.text.downcase.include?("toronto")
   i += 1 if tweet.text.downcase.include?("toronto")
   puts i if tweet.text.downcase.include?("toronto")
end

