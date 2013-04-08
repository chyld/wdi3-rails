class FlightsController < ApplicationController
  before_filter :ensure_administrator, :only => [:new, :create]

  def index
    @flights = Flight.sorted
  end

  def new
    @flight = Flight.new
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def create
    Flight.create(params[:flight])
    @flights = Flight.sorted
  end

  def search
  end

  def filter
    @flights = Flight.search(params[:depart], params[:arrive]).sorted
    render :index
  end

  def purchase
    @flight = Flight.find(params[:id])
    @flight.purchase(@auth, params[:col].to_i, params[:row].to_i)
  end

  private
  def ensure_administrator
    render :nothing => true if @auth.nil? || !@auth.is_admin
  end
end
