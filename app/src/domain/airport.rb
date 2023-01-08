class Domain::Airport
  def initialize(id:, code:, name:, country_code:, city:, terminal:, region:)
    data = {
      id:,
      code:,
      name:,
      country_code:,
      city:,
      terminal:,
      region:
    }

    errors = Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.validate_airport_data(data)
    )

    @data = data
  end

  attr_reader :id, :code, :name, :country_code, :city, :terminal, :region

  def code=(code)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.validate_code(code)
    )

    @code = code
  end

  def name=(name)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.validate_name(name)
    )

    @name = name
  end

  def country_code=(country_code)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.validate_country_code(country_code)
    )
  end

  def city=(city)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.validate_city(city)
    )
  end

  def terminal=(terminal)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.terminal(terminal)
    )
  end

  def region=(region)
    Domain::AirportValidator.throw_on_error(
      Domain::AirportValidator.region(region)
    )
  end
end
