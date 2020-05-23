class UsersController < ApplicationController
    
    get "/login" do
        erb :login
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params)
            session[:user_id] = @user.id
            redirect "/account"
        end
        erb :error
    end
    
    get "/user/new" do
        erb :'users/new'
    end
    
    post "/register" do
        if params[:username] == "" || params[:password] == ""
            redirect "/users/new"
        else
            user = User.create(username: params[:username], password: params[:password])
            redirect "/account"    
        end
    end

    get "/account" do
        @user = User.find_by_id(session[:user_id])
        if @user
            erb :'users/show'
        else
            redirect '/login'
        end
    end

    

    
end