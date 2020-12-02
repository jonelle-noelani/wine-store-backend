class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end

    # def index
    #     render json: User.all 
    # end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { message: 'Failed to create new account.' }, status: :not_acceptable
        end
    end

    def update
        # byebug
        update_user = User.find(params[:id])
        if update_user.update(user_update_params)
            render json: update_user, status: 200
        else
            render json: update_user.errors, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

    def user_update_params
        params.require(:user).permit(:password, :name, :dob, :line, :city, :state, :postal_code)
    end

end
