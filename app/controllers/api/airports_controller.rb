class Api::AirportsController < ApplicationController
  def index
    airports = Infrastructure::AirportsRepository.get_airports
    render json: Ui::AirportsPresenter.format_airports(airports)
  end

  def create
    create_airport_dto = Domain::CreateAirportDto.new(
      code: parmas[:code],
      name: params[:name],
      country_code: params[:country_code],
      city: params[:city],
      terminal: params[:terminal],
      region: params[:region]
    )
    airport = Infrastructure::AirportsRepository.create_airport(create_airport_dto)
    
    render json: Ui::AirportsPresenter.format_airport(airport)
  end
end
