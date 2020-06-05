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
        redirect "/device/#{@device.id}"
    end
end