class Api::V1::WinesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        # wines = Wine.all
        # render json: WineSeralizer.new(wines).to_json 

        render json: Wine.all
    end
end
