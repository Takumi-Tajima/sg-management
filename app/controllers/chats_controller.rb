class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @messages = Message.default_order
  end
end
