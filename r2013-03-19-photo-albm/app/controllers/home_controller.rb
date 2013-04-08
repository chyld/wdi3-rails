class HomeController < ApplicationController
  def index
    @albums = Album.order(:name)
  end
end
