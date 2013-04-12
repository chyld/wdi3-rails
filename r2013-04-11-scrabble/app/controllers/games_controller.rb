class GamesController < ApplicationController
  def send_chat
    Pusher.trigger(params[:chat_channel], 'chat', "#{@auth.username}: #{params[:chat_message]}")
    render :nothing => true
  end
  def start_game
    channel = params[:channel]
    @game = Game.where(name: channel, is_active: true).first
    @game = Game.create(name: channel, is_active: true, current_player: @auth.username) if @game.nil?
    if @game.users.exclude?(@auth)
      @game.users << @auth
      Pusher.trigger(channel, 'joingame', @auth.username)
    end
  end
  def refresh_players
    channel = params[:channel]
    @game = Game.where(name: channel, is_active: true).first
  end
end
