require 'pry'
class UsersController < ApplicationController
    
    get "/user/new" do
        erb :'users/new'
    end
    
    post "/register" do
        if params[:username] == "" || params[:password] == ""
            redirect "/users/new"
        else
            user = User.create(username: params[:username], password: params[:password])
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

    get "/user/:id/edit" do
        @user = User.find_by_id(session[:user_id])
        erb :'users/edit'
    end

    patch "/user/:id" do
        @user = User.find_by_id(session[:user_id])
        if params[:username] != ""
            @user.update(username: params[:username])
        end
        if params[:new_password] != "" && @user.authenticate(password: params[:old_password])
            @user.update(password: params[:old_password])
        end
        
        redirect "/user/#{@user.id}"
    end
end