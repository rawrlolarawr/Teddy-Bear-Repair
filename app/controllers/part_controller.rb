class PartController < ApplicationController
    get "/part/:id" do
        @part = Part.find_by_id(params[:id])
        erb :'parts/show'
    end
end