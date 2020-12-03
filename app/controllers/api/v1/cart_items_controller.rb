class Api::V1::CartItemsController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        cartItem = CartItem.create(user_id: current_user.id, wine_id: params[:wine_id])
        if cartItem.valid?
            render json: {user: UserSerializer.new(current_user)}
        else
            render json: cartItem.errors
        end
    end

    def destroy
        cartItem = CartItem.find(params[:id])
        cartItem.destroy
    end

end
