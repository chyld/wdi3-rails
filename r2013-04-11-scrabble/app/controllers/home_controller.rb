class HomeController < ApplicationController
  def index
    @channels = Channel.order(:name)
  end
end
