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
  end
end
