class UsersController < ApplicationController
    
    get "/user/new" do
        erb :'users/new'
    end
    
    post "/user/new" do
        if params[:username] == "" || params[:password] == ""
            redirect "/users/new"
        else
            user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = User.find_by_id(user.id)
            redirect "/user/#{user.id}"
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
        if params[:username] != "" || params[:username] != @user.username
            @user.update(username: params[:username])
        end
        if params[:new_password] != "" && @user.authenticate(params[:old_password])
            @user.update(password: params[:new_password])
        end
        redirect "/user/#{@user.id}"
    end

    get "/user/:id/delete" do
        @user = User.find_by_id(session[:user_id])
        erb :'users/delete'
    end

    delete "/user/:id/delete" do
        @user = User.find_by_id(session[:user_id])
        if @user.authenticate(params[:password])
            @user.delete
        end
        redirect "/login"
    end
end