class Api::AirportsController < ApplicationController
  def index
    airports = Infrastructure::AirportsRepository.get_airports
    render json: Ui::AirportsPresenter.format_airports(airports)
  end

  def create
    
  end
end
