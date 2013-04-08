class SongsController < ApplicationController
  before_filter :check_if_admin, :only => [:new, :create, :edit, :update]
  before_filter :check_if_user, :only => [:cart, :purchase, :refund]

  def index
    @songs = Song.order(:name)
  end
  def show
    @song = Song.find(params[:id])
  end
  def cart
    @song = Song.find(params[:id])
  end
  def refund
    song = Song.find(params[:id])
    if song.in?(@auth.mixtape_songs)
      @auth.balance += (song.cost * 0.70)
      @auth.save
      @auth.mixtapes.each do |mix|
        mix.songs.delete(song)
      end
    end
    redirect_to(root_path)
  end
  def purchase
    song = Song.find(params[:id])
    if song.cost <= @auth.balance
      @auth.balance -= song.cost
      @auth.save
      params[:song][:mixtape_ids].each do |mix_id|
        mixtape = Mixtape.find(mix_id)
        mixtape.songs << song
      end
    end
    redirect_to(root_path)
  end
  def new
    @song = Song.new
  end
  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to(songs_path)
    else
      render :new
    end
  end
  def edit
    @song = Song.find(params[:id])
    render :new
  end
  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to(songs_path)
    else
      render :new
    end
  end
end
