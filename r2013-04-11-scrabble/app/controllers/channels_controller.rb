class ChannelsController < ApplicationController
  def create
    name = params[:channel]
    channel = Channel.where(name: name).first
    channel = Channel.create(name: name) if channel.nil?
    @channels = Channel.order(:name)
  end
  def refresh
    @channels = Channel.order(:name)
  end
end
