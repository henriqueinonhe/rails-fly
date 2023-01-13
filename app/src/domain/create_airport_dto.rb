class Domain::CreateAirportDto
  def initialize(code:, name:, country_code:, city:, terminal:, region:)

  code_errors = Domain::AirportValidator.validate_code(code)
  name_errors = Domain::AirpotValidator.validate_name(name)
  country_code_errors = Domain::AirportValidator.validate_country_code(countr_code)
  city_errors = Domain::AirportValidator.validate_city(city)
  terminal_errors = Domain::AirportValidator.validate_terminal(terminal)
  region = Domain::AirportValidator.validate_region(region)

  errors = [
    *code_errors,
    *name_errors,
    *country_code_errors,
    *city_errors,
    *terminal_errors,
    *region
  ]

  Domain::AirportValidator.throw_on_error(errors)

  @code = code
  @name = name
  @country_code = country_code
  @city = city
  @terminal = terminal
  @region = region
  end

  attr_reader :code, :name, :country_code, :city, :terminal, :region
end