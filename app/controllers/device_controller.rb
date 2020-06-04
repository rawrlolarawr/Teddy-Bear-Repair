class DeviceController < ApplicationController
    get "/device/:id" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/show'
    end

    get "/device/:id/edit" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/edit'
    end

    
end