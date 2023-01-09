module Infrastructure::AirportsRepository
  def self.get_airports
    serialized_airports = Airport.all

    serialized_airports.map do |serialized_airport|
      Domain::Airport.new(
        id: serialized_airport.id.to_s,
        code: serialized_airport.code,
        name: serialized_airport.name,
        country_code: serialized_airport.country_code,
        city: serialized_airport.city,
        terminal: serialized_airport.terminal,
        region: serialized_airport.region
      )
    end
  end
end
