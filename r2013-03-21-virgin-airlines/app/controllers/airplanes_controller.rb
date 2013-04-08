class AirplanesController < ApplicationController
  before_filter :ensure_administrator

  def index
    @airplanes = Airplane.order(:name)
  end

  def new
    @airplane = Airplane.new
  end

  def create
    Airplane.create(params[:airplane])
    @airplanes = Airplane.order(:name)
  end

  private
  def ensure_administrator
    render :nothing => true if @auth.nil? || !@auth.is_admin
  end
end
