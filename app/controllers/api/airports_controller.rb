class Api::AirportsController < ApplicationController
  def index
    airports = Application::AirportsUseCases.get_airports
    render json: Ui::AirportsPresenter.format_airports(airports)
  end

  def create
    begin
      create_airport_dto = Domain::CreateAirportDto.new(
        code: params[:code],
        name: params[:name],
        country_code: params[:country_code],
        city: params[:city],
        terminal: params[:terminal],
        region: params[:region]
      )

      airport = Application::AirportsUseCases.create_airport(create_airport_dto)
    rescue Domain::AirportValidationException => e
      render status: 422, json: e.errors
    end

    render status: 201, json: Ui::AirportsPresenter.format_airport(airport)
  end

  def update
    update_airport_dto = Domain::UpdateAirportDto.new(
      code: params[:code],
      name: params[:name],
      country_code: params[:country_code],
      city: params[:city],
      terminal: params[:terminal],
      region: params[:region]
    )

    airport = Application::AirportsUseCases.update_airport(params[:id], update_airport_dto)

    render json: Ui::AirportsPresenter.format_airport(airport)
  end
end
