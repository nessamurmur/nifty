module Nifty
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    use OmniAuth::Builder do
      provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
    end

    use Warden::Manager

    def setup_twitter_user(info={}, credentials={})
      user = User.new(username: info['nickname'], avatar: info['image'])
      user.extend(TwitterUser)
      user.build_twitter_client(credentials['token'], credentials['secret'])
      user
    end

    get "/" do
      redirect "/auth/twitter"
    end

    get 'auth/twitter/callback' do
      user = setup_twitter_user(env['omniauth.auth']['info'],
                                env['omniauth.auth']['credentials'])

      env['warden'].set_user(user)

      redirect "/buffy"
    end

    get "auth/failure" do
      params[:message]
    end
  end
end
