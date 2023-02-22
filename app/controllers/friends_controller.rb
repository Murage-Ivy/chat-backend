class FriendsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  wrap_parameters format: []

  def index
    friends = Friend.all
    render json: friends, status: :ok
  end

  def create
    if signed_up?
      friend = current_user.friends.create!(friend_params)
      render json: friend, status: :created
    else
      onApp?
    end
  end

  def show
    friend = find_friend
    render json: friend, status: :ok
  end

  def destroy
    friend = find_friend
    friend.destroy
    head :no_content
  end

  private

  def find_friend
    Friend.find(params[:id])
  end

  def friend_params
    params.permit(:name, :email)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: [name: invalid.record.errors.full_messages_for(:name),
                           email: invalid.record.errors.full_messages_for(:email)] }
  end

  def render_user_not_found
    render json: { errors: ["User not registered on the Appliction"] }, status: :not_found
  end

  def onApp?
    render_user_not_found unless signed_up?
  end

  def signed_up?
    User.find_by(email: params[:email])
  end

  def get_regsitered_friends
    User.find()
  end
end
