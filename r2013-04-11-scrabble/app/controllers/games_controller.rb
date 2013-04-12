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
    @letters = ('A'..'Z').to_a.shuffle[0..7]
  end
  def refresh_players
    channel = params[:channel]
    @game = Game.where(name: channel, is_active: true).first
  end
  def transmit_letter
    channel = params[:channel]
    letter = params[:letter]
    row = params[:row]
    col = params[:col]
    game = Game.where(name: channel, is_active: true).first
    if game.current_player == @auth.username
      Pusher.trigger(channel, 'move_letter', {letter: letter, row: row, col: col})
      render :json => {response: true}
    else
      render :json => {response: false}
    end
  end
  def next_player
    channel = params[:channel]
    @game = Game.where(name: channel, is_active: true).first
    if @game.current_player == @auth.username
      users = @game.users.map(&:username).sort
      index = users.index(@game.current_player)
      index = (index == (users.count - 1)) ? 0 : index + 1
      @game.current_player = users[index]
      @game.save
      Pusher.trigger(channel, 'players_turn', @auth.username)
      render 'refresh_players'
    else
      render :nothing => true
    end
  end
  def grab_letters
    letters = params[:letters].split('')
    start = letters.count + 1
    @letters = letters + ('A'..'Z').to_a.shuffle[start..7]
  end
end
