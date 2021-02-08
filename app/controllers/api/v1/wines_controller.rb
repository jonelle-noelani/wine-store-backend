class Api::V1::WinesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        render json: Wine.all
    end

    def show
        wine = Wine.find(params[:id])
        render json: wine
    end

end