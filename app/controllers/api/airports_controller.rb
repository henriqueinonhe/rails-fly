class Api::AirportsController < ApplicationController
  def index
    airports = Infrastructure::AirportsRepository.get_airports
    render json: Ui::AirportsPresenter.format_airports(airports)
  end
end
