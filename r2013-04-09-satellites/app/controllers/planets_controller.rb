class PlanetsController < ApplicationController
  def index
    render json: Planet.all
  end
  def create
    planet = Planet.create(params[:planet])
    render json: planet
  end
end
