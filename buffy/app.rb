module Nifty
  class Buffy < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    layout :application

    use Warden::Manager

    def current_user
      env['warden'].user
    end

    get("/") do
      if current_user
        render 'application/root'
      else
        redirect "/auth/twitter"
      end
    end

    post("/posts") do
      Scheduling.schedule_tweet(params[:tweet], params[:time], current_user.twitter_client)
      flash[:notice] = "Tweet Scheduled"
      redirect_to "/buffy"
    end
  end
end
