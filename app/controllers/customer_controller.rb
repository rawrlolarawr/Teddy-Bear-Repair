class CustomerController < ApplicationController

    get "/customer/new" do
        erb :'customers/new'
    end

    post "/customer/new" do
        customer = User.find_by_id(session[:user_id]).customers.build(params[:customer])
        if params[:device]
            customer.devices.build(params[:device])
        end
        customer.save
        redirect "/user/#{session[:user_id]}"
    end

    get "/customer/:id" do
        @customer = Customer.find_by_id(params[:id])
        erb :'customers/show'
    end
end