class ApplicationController < ActionController::API
    before_action :authorized

    def encode(payload)
        JWT.encode(payload, 'wine')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded
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
        if decoded
            user_id = decoded[0]['user_id']
            user = User.find(user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please Log In'}, status: :unauthorized unless logged_in?
    end

end
