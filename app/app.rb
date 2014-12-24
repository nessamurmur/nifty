module Nifty
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    use OmniAuth::Builder do
      provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
    end

    get 'auth/twitter/callback' do
      query_params = env['omniauth.auth']['credentials']
        .reduce("?") { |s, (k, v)| s << k + '=' + v + '&'  }
      query_params += ''
      redirect "/buffy#{query_params}"
    end

    get "auth/failure" do
      params[:message]
    end
  end
end
