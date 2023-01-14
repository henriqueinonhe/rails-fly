module Application::AirportsUseCases
  def self.get_airports
    Infrastructure::AirportsRepository.get_airports
  end

  def self.create_airport(create_airport_dto)
    Infrastructure::AirportsRepository.create_airport(create_airport_dto)
  end

  def self.update_airport(id, update_airport_dto)
    unless update_airport_dto.instance_of? Domain::UpdateAirportDto
      raise Infrastructure::AirportsRepositoryException, 'An UpdateAirportDto was expected here!'
    end

    airport = Infrastructure::AirportsRepository.get_airport_by_id(id)

    airport.code = update_airport_dto.code
    airport.name = update_airport_dto.name
    airport.country_code = update_airport_dto.country_code
    airport.city = update_airport_dto.city
    airport.terminal = update_airport_dto.terminal
    airport.region = update_airport_dto.region

    Infrastructure::AirportsRepository.save_airport(airport)
  end
end
