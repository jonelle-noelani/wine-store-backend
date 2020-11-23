class Api::V1::WinesController < ApplicationController
    def index
        # wines = Wine.all
        # render json: WineSeralizer.new(wines).to_json 

        render json: Wine.all
    end
end
