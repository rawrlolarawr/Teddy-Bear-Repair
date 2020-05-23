class LoginController< ApplicationController
    get "/login" do
        erb :login
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/user/#{session[:user_id]}"
        end
        redirect "/login"
    end

    get "/logout" do
        session[:user_id] = nil
        redirect "/login"
    end
end