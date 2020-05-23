class UsersController < ApplicationController
    
    get "/user/new" do
        erb :'users/new'
    end
    
    post "/register" do
        if params[:username] == "" || params[:password] == ""
            redirect "/users/new"
        else
            user = User.create(username: params[:username], password: params[:password])
            binding.pry 
            redirect "/login"  
        end
    end

    get "/user/:id" do 
        if @user = User.find_by_id(session[:user_id])
            erb :'users/show'
        else
            redirect '/login'
        end
    end
end