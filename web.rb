require 'sinatra'

configure do
  require 'redis'
  require 'uri'
  REDISTOGO_URL = ENV["REDISTOGO_URL"]
  uri = URI.parse(REDISTOGO_URL)
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get "/" do
  "Try going to /shorten?url=http://www.google.com"
end

# yourapp.com/?url=http://google.com
get "/shorten" do
  # Write your code below to create a random number.
end

# Please leave this extra space at the bottom
