class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(email: params[:user][:email])
        
        if user && user.authenticate(params[:user][:password])
            token = encode({user_id: user.id})
            render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
            
        else
            render json: { message: 'Invalid username or password'}, status: :unauthorized
        end
    end

    private
## I guess I'm not using these at the moment??  yet?
    def user_login_params
        params.require(:user).permit(:email, :password)
    end

end
