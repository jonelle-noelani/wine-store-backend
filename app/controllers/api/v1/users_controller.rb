class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        debugger
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
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private
    def user_params
        # params.require(:user).permit(:name, :email, :password, :dob, :line, :city, :state, :postal_code)
        params.require(:user).permit(:email, :password)

    end
end
