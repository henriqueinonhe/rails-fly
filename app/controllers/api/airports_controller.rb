class Api::AirportsController < ApplicationController
  def index
    render json: Airport.all
  end
end
