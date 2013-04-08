class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create(params[:photo])
    album = Album.find(params[:album_id])
    album.photos << photo
    @photos = album.photos
  end
end
