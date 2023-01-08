class AirportsController < ApplicationController
  def index
    @airports = Airport.all
  end

  def show
    @airport = Airport.find_by(id: params[:id])
  end

  def new; end

  def create
    @airport = Airport.new(
      code: params[:code],
      name: params[:name],
      country_code: params[:country_code],
      city: params[:city],
      terminal: params[:terminal],
      region: params[:region]
    )

    if @airport.save
      redirect_to "/airports/#{@airport.id}"
    else
      @errors = @airport.errors
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @airport = Airport.find_by(id: params[:id])
  end

  def update
    @airport = Airport.find_by(id: params[:id])

    @airport.code = params[:code]
    @airport.name = params[:name]
    @airport.country_code = params[:country_code]
    @airport.city = params[:city]
    @airport.terminal = params[:terminal]
    @airport.region = params[:region]

    if @airport.save
      redirect_to "/airports/#{@airport.id}"
    else
      @errors = @airport.errors
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    Airport.find_by(id: params[:id]).destroy

    redirect_to '/airports'
  end
end
