class Domain::AirportValidationException < Exception
  def initialize(errors)
    @errors = errors
  end
end