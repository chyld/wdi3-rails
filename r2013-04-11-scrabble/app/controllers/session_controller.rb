class SessionController < ApplicationController
  def create
    username = params[:username]
    user = User.where(username: username).first
    user = User.create(username: username) if user.nil?
    user.is_online = true
    user.save
    session[:username] = user.username
    authenticate
    @channels = Channel.order(:name)
  end

  def destroy
    @auth.is_online = false
    @auth.save
    session[:username] = nil
    authenticate
  end
end
