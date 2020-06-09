class DeviceController < ApplicationController
    get "/device/:id" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/show'
    end

    get "/device/:id/edit" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/edit'
    end

    patch "/device/:id/edit" do
        @device = Device.find_by_id(params[:id])
        @device.update(params[:device])

        if !params[:part][:name].empty?
            @device.parts.build(params[:part])
            @device.save
        end
        redirect "/device/#{@device.id}"
    end

    get "/device/:id/delete" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/delete'
    end

    delete "/device/:id/delete" do
        @device = Device.find_by_id(params[:id])
        @user = current_user

        if @user.authenticate(params[:password])
            @device.delete
        end

        redirect "/user/dashboard"
    end
end