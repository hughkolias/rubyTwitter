require 'rubygems' 
require 'twitter'
require 'chartkick'
require 'pi_piper'

class UpdateStatus

  @@rest_client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
    config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
    config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
    config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
  end

  def initialize(tweet_text)
    @tweet_text = tweet_text
  end

  def update_twitter
    @@rest_client.update(@tweet_text)
  end

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
    @@stream_client.filter(locations: "-119.642558,49.805922,-119.619384,49.819492") do |tweet|
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

class TwitterLight

  def initialize
    @@stream_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "0c8kLnzvboMTbaafm8TzbmlpE"
      config.consumer_secret     = "bk7ObfR0LJcklusCFfD1t4myVtsdHqEWcuO4p822yqXaYudwXj"
      config.access_token        = "356556195-CdcA6ec8ih4KpLFGyRftwryJu7ZfIYUypso2QFrb"
      config.access_token_secret = "gQu0EgHOpzvCq9Ve5KE6afO8uHoJnutlRBf0L4acWMsLs"
    end

    @pin = PiPiper::Pin.new( :pin => 17, :direction => :out )
  end

  def userstream
    @@stream_client.user do |object|
      if object.is_a?(Twitter::Tweet) && tweet.text.downcase.include?('led on')
        light_the_led
      end
    end
  end

  def light_the_led
    puts 'LED ON'
    @pin.on
    sleep 10
    @pin.off
  end

end

bob = TwitterLight.new
bob.userstream

# puts "Type in what word you would like to filter?"
# filter_name = gets.chomp
# puts "filtering tweets using the word #{filter_name}"

# Toronto_filter = TwitterStream.new(filter_name)
# Toronto_filter.stream

#puts "Type in what you would like to tweet:"
#tweet_text = gets.chomp
#puts "updating your twitter account with the following tweet: #{tweet_text}"
#hugh = UpdateStatus.new(tweet_text)
#hugh.update_twitter
