require 'rubygems' 
require 'twitter'
require 'chartkick'

$rest_client = Twitter::REST::Client.new do |config|
 config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
  config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
  config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
  config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
end

class TwitterStream
  
  @@stream_client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
    config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
    config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
    config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
  end

  @@i=0

  def initialize(filter_name)
    @filter_name = filter_name
  end
  
  def stream
    @@stream_client.filter(locations: "-79.399837,43.657540,-79.381129,43.679445") do |tweet|
      if filter_is_true(tweet)
        puts "#{tweet.user.name} says: #{tweet.text}"
        print_counter
      end
    end
  end

  def filter_is_true(tweet)
    tweet.text.downcase.include?(@filter_name)
  end

  def print_counter
    @@i += 1
    puts @@i
  end

end

Toronto_filter = TwitterStream.new("")
Toronto_filter.stream
