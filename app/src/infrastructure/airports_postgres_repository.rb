module Infrastructure::AirportsPostgresRepository
  def self.get_airports
    serialized_airports = Airport.all

    serialized_airports.map do |serialized_airport|
      map_serialized_airport_to_airport(serialized_airport)
    end
  end

  def self.get_airport_by_id(id)
    serialized_airport = Airport.find_by(id:)

    unless serialized_airport
      errors = [Domain::AirportValidationError.new(
        message: 'There is no airport with id #{id}!',
        reason: 'AIRPORT_NOT_FOUND'
      )]
      raise Domain::AirportValidationException, errors
    end

    map_serialized_airport_to_airport(serialized_airport)
  end

  def self.create_airport(create_airport_dto)
    unless create_airport_dto.instance_of? Domain::CreateAirportDto
      raise Exceptions::LogicError, 'A CreateAirportDto was expected here!'
    end

    serialized_airport = nil

    Airport.transaction(isolation: :serializable) do
      duplicate_airport_candidate = Airport.find_by(code: create_airport_dto.code)

      if duplicate_airport_candidate
        errors = [
          Domain::AirportValidationError.new(
            message: "There is already an airport with code '#{airport.code}'!",
            reason: 'DUPLICATE_AIRPORT_CODE'
          )
        ]
      end

      serialized_airport = Airport.new(
        code: create_airport_dto.code,
        name: create_airport_dto.name,
        country_code: create_airport_dto.country_code,
        city: create_airport_dto.city,
        terminal: create_airport_dto.terminal,
        region: create_airport_dto.region
      )
      serialized_airport.save
    end

    map_serialized_airport_to_airport(serialized_airport)
  end

  def self.save_airport(airport)
    raise Exceptions::LogicException, 'An Airport was expected here!' unless airport.instance_of? Domain::Airport

    Airport.transaction(isolation: :serializable) do
      duplicate_airport_candidate = get_airport_by_id(airport.id)

      if duplicate_airport_candidate && duplicate_airport_candidate.id != airport.id
        errors = [
          Domain::AirportValidationError.new(
            message: "There is already an airport with code '#{airport.code}'!",
            reason: 'DUPLICATE_AIRPORT_CODE'
          )
        ]
      end

      serialized_airport = Airport.find_by(id: airport.id)
      serialized_airport.code = airport.code
      serialized_airport.name = airport.name
      serialized_airport.country_code = airport.country_code
      serialized_airport.city = airport.city
      serialized_airport.terminal = airport.terminal
      serialized_airport.region = airport.region

      serialized_airport.save
    end

    airport
  end

  def self.delete_airport(airport)
    raise Exceptions::LogicException, 'An Airport was expected here!' unless airport.instance_of? Domain::Airport

    Airport.transaction(isolation: :serializable) do
      serialized_airport = Airport.find_by(id: airport.id)
      serialized_airport.destroy
    end

    airport
  end

  def self.map_serialized_airport_to_airport(serialized_airport)
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

  def self.map_airport_to_serialized_airport(airport)
    Airport.new(
      id: airport.id,
      code: airport.code,
      name: airport.name,
      country_code: airport.country_code,
      city: airport.city,
      terminal: airport.terminal,
      region: airport.region
    )
  end
end
