class Domain::AirportValidationError
  def initialize(message:, reason:)
    @message = message
    @reason = reason
  end
end
