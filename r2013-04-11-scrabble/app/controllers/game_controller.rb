class GameController < ApplicationController
  def send_chat
    Pusher.trigger(params[:chat_channel], 'chat', params[:chat_message])
    render :nothing => true
  end
end
