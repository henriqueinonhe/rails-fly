require 'rails_helper'

RSpec.describe Domain::AirportValidator do
  context 'validate_id' do
    def setup(id:)
      Domain::AirportValidator.validate_id(id)
    end

    context 'When `id` is not a string' do
      def second_setup
        setup(id: 123)
      end

      it 'Returns ID_IS_NOT_A_STRING error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('ID_IS_NOT_A_STRING')
      end
    end

    context 'When `id` is valid' do
      def second_setup
        setup(id: '123')
      end

      it 'Returns empty errors array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_code' do
    def setup(code:)
      Domain::AirportValidator.validate_code(code)
    end

    context 'When `code` is not a string' do
      def second_setup
        setup(code: 132)
      end

      it 'Returns CODE_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CODE_IS_NOT_A_STRING')
      end
    end

    context 'When `code` is too short' do
      def second_setup
        setup(code: 'AP')
      end

      it 'Returns CODE_TOO_SHORT error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CODE_TOO_SHORT')
      end
    end

    context 'When `code` is too big' do
      def second_setup
        setup(code: 'ASDFKASJDIOJASDASDS')
      end

      it 'Returns CODE_TOO_BIG error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CODE_TOO_BIG')
      end
    end

    context 'When `code` is not formatted correctly' do
      def second_setup
        setup(code: 'vny')
      end

      it 'Returns CODE_WRONG_FORMAT error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CODE_WRONG_FORMAT')
      end
    end

    context 'When `code` is valid' do
      def second_setup
        setup(code: 'VNY')
      end

      it 'Returns empty error array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_name' do
    def setup(name:)
      Domain::AirportValidator.validate_name(name)
    end

    context 'When `name` is not a string' do
      def second_setup
        setup(name: 132)
      end

      it 'Returns NAME_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('NAME_IS_NOT_A_STRING')
      end
    end

    context 'When `name` is too short' do
      def second_setup
        setup(name: 'A')
      end

      it 'Returns NAME_TOO_SHORT error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('NAME_TOO_SHORT')
      end
    end

    context 'When `name` is too big' do
      def second_setup
        setup(name: 'a' * (Domain::AirportValidator::NAME_MAX_LENGTH + 1))
      end

      it 'Returns NAME_TOO_BIG error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('NAME_TOO_BIG')
      end
    end

    context 'When `name` is valid' do
      def second_setup
        setup(name: 'Los Cabos')
      end

      it 'Returns empty error array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_country_code' do
    def setup(country_code:)
      Domain::AirportValidator.validate_country_code(country_code)
    end

    context 'When `country_code` is not a string' do
      def second_setup
        setup(country_code: 132)
      end

      it 'Returns COUNTRY_CODE_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('COUNTRY_CODE_IS_NOT_A_STRING')
      end
    end

    context 'When `country_code` is too short' do
      def second_setup
        setup(country_code: 'A' * (Domain::AirportValidator::COUNTRY_CODE_MIN_LENGTH - 1))
      end

      it 'Returns COUNTRY_CODE_TOO_SHORT error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('COUNTRY_CODE_TOO_SHORT')
      end
    end

    context 'When `country_code` is too big' do
      def second_setup
        setup(country_code: 'A' * (Domain::AirportValidator::COUNTRY_CODE_MAX_LENGTH + 1))
      end

      it 'Returns COUNTRY_CODE_TOO_BIG error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('COUNTRY_CODE_TOO_BIG')
      end
    end

    context 'When `country_code` is in the wrong format' do
      def second_setup
        setup(country_code: 'ASD8Sds')
      end

      it 'Returns COUNTRY_CODE_WRONG_FORMAT error' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('COUNTRY_CODE_WRONG_FORMAT')
      end
    end

    context 'When `contry_code` is valid' do
      def second_setup
        setup(country_code: 'US')
      end

      it 'Returns empty errors array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_city' do
    def setup(city:)
      Domain::AirportValidator.validate_city(city)
    end

    context 'When `city` is not a string' do
      def second_setup
        setup(city: 132)
      end

      it 'Returns CITY_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CITY_IS_NOT_A_STRING')
      end
    end

    context 'When `city` is too short' do
      def second_setup
        setup(city: 'A' * (Domain::AirportValidator::CITY_MIN_LENGTH - 1))

        it 'Returns CITY_TOO_SHORT error' do
          errors = second_setup
          first_error = errors[0]

          expect(errors).to eq(1)
          expect(first_error).to be_instance_of(Domain::AirportValidationError)
          expect(first_error.reason).to eq('CITY_TOO_SHORT')
        end
      end
    end

    context 'When `city` is too long' do
      def second_setup
        setup(city: 'A' * (Domain::AirportValidator::CITY_MAX_LENGTH + 1))
      end

      it 'Returns CITY_TOO_BIG error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('CITY_TOO_BIG')
      end
    end

    context 'When `city` is valid' do
      def second_setup
        setup(city: 'Los Cabos')
      end

      it 'Returns empty errors array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_terminal' do
    def setup(terminal:)
      Domain::AirportValidator.validate_terminal(terminal)
    end

    context 'When `terminal` is not a string' do
      def second_setup
        setup(terminal: 132)
      end

      it 'Returns TERMINAL_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('TERMINAL_IS_NOT_A_STRING')
      end
    end

    context 'When `terminal` is too short' do
      def second_setup
        setup(terminal: 'A' * (Domain::AirportValidator::TERMINAL_MIN_LENGTH - 1))
      end

      it 'Returns TERMINAL_TOO_SHORT error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('TERMINAL_TOO_SHORT')
      end
    end

    context 'When `terminal` is too long' do
      def second_setup
        setup(terminal: 'A' * (Domain::AirportValidator::TERMINAL_MAX_LENGTH + 1))
      end

      it 'Returns TERMINAL_TOO_BIG error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('TERMINAL_TOO_BIG')
      end
    end

    context 'When `terminal` is valid' do
      def second_setup
        setup(terminal: 'TERMINAL A')
      end

      it 'Returns empty errors array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_region' do
    def setup(region:)
      Domain::AirportValidator.validate_region(region)
    end

    context 'When `region` is not a string' do
      def second_setup
        setup(region: 132)
      end

      it 'Returns REGION_IS_NOT_A_STRING' do
        errors = second_setup
        first_error = errors.first

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('REGION_IS_NOT_A_STRING')
      end
    end

    context 'When `region` is too short' do
      def second_setup
        setup(region: 'A' * (Domain::AirportValidator::REGION_MIN_LENGTH - 1))
      end

      it 'Returns REGION_TOO_SHORT error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('REGION_TOO_SHORT')
      end
    end

    context 'When `region` is too long' do
      def second_setup
        setup(region: 'A' * (Domain::AirportValidator::REGION_MAX_LENGTH + 1))
      end

      it 'Returns REGION_TOO_BIG error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('REGION_TOO_BIG')
      end
    end

    context 'When `region` is in the wrong format' do
      def second_setup
        setup(region: 'na')
      end

      it 'Returns REGION_WRONG_FORMAT error' do
        errors = second_setup
        first_error = errors[0]

        expect(errors.length).to eq(1)
        expect(first_error).to be_instance_of(Domain::AirportValidationError)
        expect(first_error.reason).to eq('REGION_WRONG_FORMAT')
      end
    end

    context 'When `region` is valid' do
      def second_setup
        setup(region: 'NA')
      end

      it 'Returns empty errors array' do
        errors = second_setup

        expect(errors.length).to eq(0)
      end
    end
  end

  context 'validate_airport_data' do
    def setup(data:)
      Domain::AirportValidator.validate_airport_data(data)
    end

    context 'When there are errors' do
      def second_setup
        setup(data: {
                id: 123,
                code: 'ASE',
                name: 'Los Cabos',
                country_code: 'us',
                city: 'Los Cabos',
                terminal: 'Terminal',
                region: 'na'
              })
      end

      it 'Aggregates all errors' do
        errors = second_setup

        expect(errors.length).to eq(3)

        first_error, second_error, third_error = errors
        expect(first_error.reason).to eq('ID_IS_NOT_A_STRING')
        expect(second_error.reason).to eq('COUNTRY_CODE_WRONG_FORMAT')
        expect(third_error.reason).to eq('REGION_WRONG_FORMAT')
      end
    end
  end

  context 'throw_on_error' do
    def setup(errors:)
      Domain::AirportValidator.throw_on_error(errors)
    end

    context 'When there are errors' do
      def second_setup
        setup(errors: [
                Domain::AirportValidationError.new(
                  message: 'Some error',
                  reason: 'SOME_ERROR'
                )
              ])
      end

      it 'Throws AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'When there are NO errors' do
      def second_setup
        setup(errors: [])
      end

      it "Doesn't throw anything" do
        expect { second_setup }.not_to raise_error
      end
    end
  end
end
