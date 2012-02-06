require "rubygems"
require "rack/test"
ENV["REDISTOGO_URL"] = "http://localhost:6379"
require "./web.rb"

describe "URL Shortener" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns a short code" do
    get "/shorten?url=http://google.com"
    last_response.body.should =~ /(\d){5}/
  end

  it "returns a different code for different URLs" do
    get "/shorten?url=http://google.com"
    response_1 = last_response
    get "/shorten?url=http://reddit.com"
    response_2 = last_response

    response_1.body.should_not == response_2.body
  end
end
