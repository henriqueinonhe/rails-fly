module Ui::AirportsPresenter
  def self.format_airports(airports)
    airports.map do |airport|
      format_airport(airport)
    end
  end

  def self.format_airport(airport)
    {
      id: airport.id,
      code: airport.code,
      name: airport.name,
      country_code: airport.country_code,
      city: airport.city,
      terminal: airport.terminal,
      region: airport.region
      }
  end
end
