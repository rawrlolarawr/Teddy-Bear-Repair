require 'pry'
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

    get "/customer/:id/edit" do
        @customer = Customer.find_by_id(params[:id])
        erb :'customers/edit'
    end

    patch "/customer/:id/edit" do
        @customer = Customer.find_by_id(params[:id])
        if !params[:customer][:name].empty? || @customer.name
            @customer.update(name: params[:customer][:name])
        end
        if !params[:customer][:phone_number].empty? || @customer.phone_number
            @customer.update(phone_number: params[:customer][:phone_number])
        end
        redirect "/customer/#{@customer.id}"
    end
end