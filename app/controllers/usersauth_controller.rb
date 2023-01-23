class UsersauthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: user_params[:username])
    if (@user && @user.authenticate(user_params[:password]))
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { errors: ["Invalid password or username"] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
