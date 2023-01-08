class Api::RoutesController < ApplicationController
  def index
    routes = Route.all

    formatted_routes = routes.map do |route|
      {
        id: route.id,
        origin: route.origin,
        destination: route.destination
      }
    end

    render json: formatted_routes
  end
end
