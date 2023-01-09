module Domain::AirportValidator
  CODE_MIN_LENGTH = 3
  CODE_MAX_LENGTH = 5

  NAME_MIN_LENGTH = 2
  NAME_MAX_LENGTH = 50

  COUNTRY_CODE_MIN_LENGTH = 2
  COUNTRY_CODE_MAX_LENGTH = 10

  CITY_MIN_LENGTH = 2
  CITY_MAX_LENGTH = 50

  TERMINAL_MIN_LENGTH = 2
  TERMINAL_MAX_LENGTH = 50

  REGION_MIN_LENGTH = 2
  REGION_MAX_LENGTH = 10

  def self.throw_on_error(errors)
    raise Domain::AirportValidationException, errors if errors.length > 0
  end

  def self.validate_airport_data(data)
    id = data[:id]
    code = data[:code]
    name = data[:name]
    country_code = data[:country_code]
    city = data[:city]
    terminal = data[:terminal]
    region = data[:region]

    id_errors = validate_id(id)
    code_errors = validate_code(code)
    name_errors = validate_name(name)
    country_code_errors = validate_country_code(country_code)
    city_errors = validate_city(city)
    terminal_errors = validate_terminal(terminal)
    region_errors = validate_region(region)

    [
      *id_errors,
      *code_errors,
      *name_errors,
      *country_code_errors,
      *city_errors,
      *terminal_errors,
      *region_errors
    ]
  end

  def self.validate_id(id)
    unless id.is_a? String
      return [
        Domain::AirportValidationError.new(
          message: "Airport `id` is expected to be a string, but #{id.class} was received instead.",
          reason: 'ID_IS_NOT_A_STRING'
        )
      ]
    end

    []
  end

  def self.validate_code(code)
    if code.length < CODE_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `code` is expected to have length between #{CODE_MIN_LENGTH} and #{CODE_MAX_LENGTH} inclusive, but #{code.length} was received instead.",
        reason: 'CODE_TOO_SHORT'
      )]
    end

    if code.length > CODE_MAX_LENGTH

      return [Domain::AirportValidationError.new(
        message: "Airport `code` is expected to have length between #{CODE_MIN_LENGTH} and #{CODE_MAX_LENGTH} inclusive, but #{code.length} was received instead.",
        reason: 'CODE_TOO_BIG'
      )]
    end

    unless code =~ /^[A-Z]+$/

      return [Domain::AirportValidationError.new(
        message: "Airport `code` is expected to be composed solely of upper case ASCII letters, but '#{code}' was received instead.",
        reason: 'CODE_WRONG_FORMAT'
      )]
    end

    []
  end

  def self.validate_name(name)
    if name.length < NAME_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `name` is expected to have length between #{NAME_MIN_LENGTH} and #{NAME_MAX_LENGTH} inclusive, but #{name.length} was received instead.",
        reason: 'NAME_TOO_SHORT'
      )]
    end

    if name.length > NAME_MAX_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `name` is expected to have length between #{NAME_MIN_LENGTH} and #{NAME_MAX_LENGTH} inclusive, but #{name.length} was received instead.",
        reason: 'NAME_TOO_BIG'
      )]
    end

    []
  end

  def self.validate_country_code(country_code)
    if country_code.length < COUNTRY_CODE_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `country_code` is expected to have length between #{COUNTRY_CODE_MIN_LENGTH} and #{COUNTRY_CODE_MAX_LENGTH} inclusive, but #{country_code.length} was received instead.",
        reason: 'COUNTRY_CODE_TOO_SHORT'
      )]
    end

    if country_code.length > COUNTRY_CODE_MAX_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `country_code` is expected to have length between #{COUNTRY_CODE_MIN_LENGTH} and #{COUNTRY_CODE_MAX_LENGTH} inclusive, but #{country_code.length} was received instead.",
        reason: 'COUNTRY_CODE_TOO_BIG'
      )]
    end

    unless country_code =~ /^[A-Z]+$/
      return [Domain::AirportValidationError.new(
        message: "Airport `country_code` is expected to be composed solely of uppercase ASCII letters, but '#{country_code}' was found instead.",
        reason: 'COUNTRY_CODE_WRONG_FORMAT'
      )]
    end

    []
  end

  def self.validate_city(city)
    if city.length < CITY_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `city` is expected to have length between #{CITY_MIN_LENGTH} and #{CITY_MAX_LENGTH} inclusive, but #{city.length} was received instead.",
        reason: 'CITY_TOO_SHORT'
      )]
    end

    if city.length > CITY_MAX_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `city` is expected to have length between #{CITY_MIN_LENGTH} and #{CITY_MAX_LENGTH} inclusive, but #{city.length} was received instead.",
        reason: 'CITY_TOO_BIG'
      )]
    end

    []
  end

  def self.validate_terminal(terminal)
    if terminal.length < TERMINAL_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `terminal` is expected to have length between #{TERMINAL_MIN_LENGTH} and #{TERMINAL_MAX_LENGTH} inclusive, but #{terminal.length} was received instead.",
        reason: 'TERMINAL_TOO_SHORT'
      )]
    end

    if terminal.length > TERMINAL_MAX_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `terminal` is expected to have length between #{TERMINAL_MIN_LENGTH} and #{TERMINAL_MAX_LENGTH} inclusive, but #{terminal.length} was received instead.",
        reason: 'TERMINAL_TOO_BIG'
      )]
    end

    []
  end

  def self.validate_region(region)
    if region.length < REGION_MIN_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `region` is expected to have length between #{REGION_MIN_LENGTH} and #{REGION_MAX_LENGTH} inclusive, but #{region.length} was received instead.",
        reason: 'REGION_TOO_SHORT'
      )]
    end

    if region.length > REGION_MAX_LENGTH
      return [Domain::AirportValidationError.new(
        message: "Airport `region` is expected to have length between #{REGION_MIN_LENGTH} and #{REGION_MAX_LENGTH} inclusive, but #{region.length} was received instead.",
        reason: 'REGION_TOO_BIG'
      )]
    end

    unless region =~ /^[A-Z]+$/
      return [Domain::AirportValidationError.new(
        message: "Airport `region` is expected to be composed solely of uppercase ASCII letters, but '#{region}' was received instead.",
        reason: 'REGION_WRONG_FORMAT'
      )]
    end

    []
  end
end
