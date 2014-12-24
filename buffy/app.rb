module Nifty
  class Buffy < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    layout :application

    get("/") do
      @auth = params[:token]
      render 'application/root'
    end
  end
end
