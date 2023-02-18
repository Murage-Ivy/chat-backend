class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:create]
  wrap_parameters format: []

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = find_user
    render json: user, Serializer: PersonMessageSerializer, status: :ok
  end

  def create
    @user = User.create!(user_params)
    @token = encode_token(user_id: @user.id)
    # cookies[:user_id] ||= @user.id
    render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  end

  private

  def user_params
    params.permit(:username,
                  :email,
                  :password,
                  :password_confirmation,
                  :image)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: [username: invalid.record.errors.full_messages_for(:username),
                           password: invalid.record.errors.full_messages_for(:password),
                           password_confirmation: invalid.record.errors.full_messages_for(:password_confirmation),
                           email: invalid.record.errors.full_messages_for(:email)] }, status: :unprocessable_entity
  end

  def find_user
    User.find(params[:id])
  end
end
