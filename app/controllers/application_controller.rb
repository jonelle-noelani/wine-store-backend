class ApplicationController < ActionController::API
    before_action :authorized

    def encode(payload)
        JWT.encode(payload, 'wine')
    end

    def auth_header
        # byebug
        request.headers['Authorization']
    end

    def decoded
        # byebug
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'wine', true, algorithm: "HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        # byebug
        if decoded
            user_id = decoded[0]['user_id']
            # user = User.find_by(id: user_id)
            user = User.find(user_id)
        end
        # byebug
    end

    def logged_in?
        # byebug
        !!current_user
    end

    def authorized
        # byebug
        render json: { message: 'Please Log In'}, status: :unauthorized unless logged_in?
    end

end
