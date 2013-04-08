class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    Album.create(params[:album])
    @albums = Album.order(:name)
  end

  def show
    album = Album.find(params[:id])
    @photos = album.photos
  end

  def filter
    album = Album.find(params[:id])
    @photos = album.photos.limit(params[:count])
  end
end
