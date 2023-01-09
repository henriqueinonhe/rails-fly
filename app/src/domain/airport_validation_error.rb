class Domain::AirportValidationError
  def initialize(message:, reason:)
    @message = message
    @reason = reason
  end

  attr_reader :message, :reason
end
