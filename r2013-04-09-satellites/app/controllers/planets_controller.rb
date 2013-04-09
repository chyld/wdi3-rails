class PlanetsController < ApplicationController
  def index
    render json: Planet.all
  end
end
