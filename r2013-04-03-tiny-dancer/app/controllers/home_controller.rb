class HomeController < ApplicationController
  def index
    @artists = Artist.all
  end
end
