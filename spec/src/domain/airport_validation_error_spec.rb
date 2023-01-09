require 'rails_helper'

RSpec.describe 'AirportValidationError' do
  context 'When reading attributes' do
    it 'Attributes can be read' do
      error = Domain::AirportValidationError.new(message: 'Message', reason: 'REASON')
      expect(error.message).to eq('Message')
      expect(error.reason).to eq('REASON')
    end
  end
end
