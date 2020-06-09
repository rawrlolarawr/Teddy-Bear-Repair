require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    redirect "/user/dashboard"
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def authenticate
      redirect '/login' if !logged_in?
    end

    def authorize(customer)
      authenticate
      redirect '/user/dashboard' if customer.user != current_user
    end
  end
end
