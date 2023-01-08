class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    @route = Route.find_by(id: params[:id])
  end

  def new
    @airports = Airport.all
  end

  def create
    origin = Airport.find_by!(id: params[:origin])
    destination = Airport.find_by!(id: params[:destination])

    route = Route.new(
      origin:,
      destination:
    )

    if route.save
      redirect_to "/routes/#{route.id}"
    else
      render :new
    end
  end

  def edit
    @route = Route.find_by(id: params[:id])
    @airports = Airport.all
  end

  def delete
    route = Route.find_by(id: params[:id])
    route.destroy

    redirect_to '/routes'
  end
end
