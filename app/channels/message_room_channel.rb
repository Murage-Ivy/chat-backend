class MessageRoomChannel < ApplicationCable::Channel
  def subscribed
    # user_id = decode_token[0]["user_id"]
    # stream_from "private_chat_#{user_id}"
    token = params[:token]
    decoded_token = JWT.decode(token, ENV["my_secret"])
    user_id = decoded_token[0]["user_id"]
    user = User.find(user_id)
    stream_for user

    # stream_from "private_chat"
    # # stream_for
    # # @user = current_user
    # # stream_for @user
    # byebug
  end

  def receive(data)
    receipent = User.find(data[:reciever])
    MessageRoomChannel.broadcast_to(receipent, data)

    byebug
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
