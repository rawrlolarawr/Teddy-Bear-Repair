class LoginController< ApplicationController
    get "/login" do
        if logged_in?
            redirect "/user/dashboard"
        end
        erb :login
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/user/dashboard"
        end
        redirect "/login"
    end

    get "/logout" do
        session.clear
        redirect "/login"
    end
end