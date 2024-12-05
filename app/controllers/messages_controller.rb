class MessagesController < ApplicationController
  before_action :set_chat
  def new
    @message = @chat.messages.build
  end

  def create
    @message = @chat.messages.create!(message_params)

    openai_client = OpenaiClient.new
    ai_response = openai_client.chat_with_openai(@message.content)

    @chat.messages.create!(role: ai_response[:role], content: ai_response[:content])

    redirect_to chat_path(@chat)
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(%i[chat_id role content])
  end
end
