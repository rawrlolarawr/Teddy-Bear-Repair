class UserController < ApplicationController
    
    get "/user/new" do
        erb :'users/new'
    end
    
    post "/user/new" do
        if params[:username] == "" || params[:password] == ""
            redirect "/users/new"
        else
            user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = user.id
            redirect "/user/dashboard"
        end
    end

    get "/user/dashboard" do 
        if @user = current_user
            erb :'users/show'
        else
            redirect '/login'
        end
    end

    get "/user/dashboard/edit" do
        @user = current_user
        erb :'users/edit'
    end

    patch "/user/dashboard" do
        @user = current_user
        if params[:username] != "" || params[:username] != @user.username
            @user.update(username: params[:username])
        end
        if params[:new_password] != "" && @user.authenticate(params[:old_password])
            @user.update(password: params[:new_password])
        end
        redirect "/user/#{@user.id}"
    end

    get "/user/dashboard/delete" do
        @user = current_user
        erb :'users/delete'
    end

    delete "/user/dashboard/delete" do
        @user = current_user
        if @user.authenticate(params[:password])
            @user.delete
        end
        redirect "/login"
    end
end