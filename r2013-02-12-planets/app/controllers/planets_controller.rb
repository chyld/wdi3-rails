class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end
  def new
  end
  def create
    Planet.create(params[:planet])
    redirect_to(planets_path)
  end
  def show
    @planet = Planet.find(params[:id])
  end
  def destroy
    planet = Planet.find(params[:id])
    planet.delete
    redirect_to(planets_path)
  end
  def edit
    @planet = Planet.find(params[:id])
  end
  def update
    planet = Planet.find(params[:id])
    planet.update_attributes(params[:planet])
    redirect_to(planets_path)
  end
end
