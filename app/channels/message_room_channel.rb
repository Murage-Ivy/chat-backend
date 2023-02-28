class MessageRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def receive data 
    ActionCable.server.broadcast current_user, 
  end 

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
