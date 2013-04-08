class MixtapesController < ApplicationController
  before_filter :check_if_user, :only => [:new, :create]
  before_filter :check_if_specific_user, :only => [:show]

  def show
    @mixtape = Mixtape.find(params[:id])
  end
  def new
    @mixtape = Mixtape.new
  end
  def create
    @mixtape = Mixtape.new(params[:mixtape])
    if @mixtape.save
      @auth.mixtapes << @mixtape
      redirect_to(root_path)
    else
      render :new
    end
  end
  private
  def check_if_specific_user
    redirect_to(root_path) if @auth.nil? || @auth.mixtape_ids.exclude?(params[:id].to_i)
  end
end
