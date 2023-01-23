class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages, status: :ok
  end

  def create
    message = Message.create!(message_params)
    render json: message, status: :created
  end

  def update
    message = find_meaasge
    message.update!
    render json: message, status: :accepted
  end

  def destroy
    message = find_message
    message.destroy
    head :no_content
  end

  private

  def message_params
    params.permit(:message, :user_id)
  end

  def find_message
    Message.find(params[:id])
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: [invalid.record.errors.full_messages] }, status: :unprocessable_entity
  end
end
