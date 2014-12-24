module Nifty
  module TwitterUser
    attr_reader :token, :secret, :client

    def build_client(token, secret, client_class=Twitter::REST::Client)
      @client = client_class.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = token
        config.access_token_secret = secret
      end
      @client
    end
  end
end
