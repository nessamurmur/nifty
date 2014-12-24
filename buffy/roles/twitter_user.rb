module Nifty
  module TwitterUser
    attr_reader :token, :secret, :twitter_client

    def build_twitter_client(token, secret, client_class=Twitter::REST::Client)
      @twitter_client = client_class.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = token
        config.access_token_secret = secret
      end
      @twitter_client
    end
  end
end
