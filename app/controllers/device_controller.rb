class DeviceController < ApplicationController
    get "/device/:id" do
        @device = Device.find_by_id(params[:id])
        erb :'devices/show'
    end

end