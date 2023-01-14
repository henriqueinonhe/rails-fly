class Domain::AirportValidationException < Exception
  def initialize(errors)
    super((errors.map do |error|
      error.message
    end).join('
      '))

    @errors = errors
  end

  attr_reader :errors
end
