class MessagesController < ApplicationController
  before_action :set_chat
  def new
    @message = @chat.messages.build
  end

  def create
    @message = @chat.messages.build(message_params)

    if @message.save
      redirect_to chat_path(@chat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(%i[chat_id role content])
  end
end
