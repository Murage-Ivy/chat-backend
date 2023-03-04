class ApplicationController < ActionController::Base
  # include ActionController::Cookies

  before_action :authorized
  skip_before_action :verify_authenticity_token

  def encode_token(payload)
    JWT.encode(payload, ENV["my_secret"])
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decode_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, ENV["my_secret"])
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      user_id = decode_token[0]["user_id"]
      user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { errors: ["Please log in"] }, status: :unauthorized unless logged_in?
  end
end
