module Infrastructure::AirportsRepository
  def self.get_airports
    serialized_airports = Airport.all

    serialized_airports.map do |serialized_airport|
      map_serialized_airport_to_airport(airport)
    end
  end

  def self.create_airport(create_airport_dto)
    if !(create_airport_dto.instance_of? Domain::CreateAirportDto) 
      raise Exception.new("A CreateAirportDto was expected here!")
    end

    serialized_airport = Airport.new(
      code: create_airport_dto.code,
      name: create_airport_dto.name,
      contry_code: create_airport_dto.coutry_code,
      city: create_airport_dto.city,
      terminal: create_airport_dto.terminal,
      region: create_airport_dto.region
    )
    serialized_airport.save()

    return map_serialized_airport_to_airport(serialized_airport)
  end

  def self.update_airport(update_airport_dto)
  end

  def map_serialized_airport_to_airport(serialized_airport)
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
