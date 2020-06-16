class CustomerController < ApplicationController

    get "/customer/new" do
        authenticate
        erb :'customers/new'
    end

    post "/customer/new" do
        customer = current_user.customers.build(params[:customer])
        if !params[:device][:make].empty? && !params[:device][:model].empty? && !params[:device][:issue].empty? && !params[:device][:received].empty?
            customer.devices.build(params[:device])
        end
        customer.save
        redirect "/user/dashboard"
    end

    get "/customer/:id" do
        @customer = Customer.find_by_id(params[:id])
        authorize(@customer)
        erb :'customers/show'
    end

    get "/customer/:id/edit" do
        @customer = Customer.find_by_id(params[:id])
        authorize(@customer)
        erb :'customers/edit'
    end

    patch "/customer/:id/edit" do
        @customer = Customer.find_by_id(params[:id])
        if !params[:customer][:name].empty? || !@customer.name
            @customer.update(name: params[:customer][:name])
        end
        if !params[:customer][:phone_number].empty? || !@customer.phone_number
            @customer.update(phone_number: params[:customer][:phone_number])
        end
        if !params[:device][:make].empty? && !params[:device][:model].empty? && !params[:device][:issue].empty? && !params[:device][:received].empty?
            device = @customer.devices.build(params[:device])
            device.save
        end
        redirect "/customer/#{@customer.id}"
    end

    get "/customer/:id/delete" do
        @customer = Customer.find_by_id(params[:id])
        authorize(@customer)
        erb :'customers/delete'
    end
    
    delete "/customer/:id/delete" do
        @customer = Customer.find_by_id(params[:id])
        @user = current_user
        if @user.authenticate(params[:password]) && @user.customers.include?(@customer)
            @customer.delete
        end
        redirect "/user/dashboard"
    end
end

