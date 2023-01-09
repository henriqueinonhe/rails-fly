require 'rails_helper'

RSpec.describe Domain::Airport do
  context 'When creating an Airport' do
    def setup(id:, code:, name:, country_code:, city:, terminal:, region:)
      Domain::Airport.new(
        id:, code:, name:, country_code:, city:, terminal:, region:
      )
    end

    context 'And data used to create Airport is invalid' do
      def second_setup
        setup(
          id: 123,
          code: 'ASE',
          name: 'Los Cabos',
          country_code: 'us',
          city: 'Los Cabos',
          terminal: 'Terminal',
          region: 'na'
        )
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And data used to create Airport is valid' do
      def second_setup
        setup(
          id: '123',
          code: 'ASE',
          name: 'Los Cabos',
          country_code: 'US',
          city: 'Los Cabos',
          terminal: 'Terminal',
          region: 'NA'
        )
      end

      it 'Returns created airport' do
        airport = second_setup

        expect(airport).to be_instance_of(Domain::Airport)
      end
    end
  end

  context 'When setting `code`' do
    def setup(code:)
      airport = Domain::Airport.new(
        id: '123',
        code: 'ASE',
        name: 'Los Cabos',
        country_code: 'US',
        city: 'Los Cabos',
        terminal: 'Terminal',
        region: 'NA'
      )

      airport.code = code

      airport.code
    end

    context 'And `code` is invalid' do
      def second_setup
        setup(code: 'a')
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And `code` is valid' do
      def second_setup
        setup(code: 'VNY')
      end

      it 'Updates `code`' do
        code = second_setup

        expect(code).to eq('VNY')
      end
    end
  end

  context 'When setting `name`' do
    def setup(name:)
      airport = Domain::Airport.new(
        id: '123',
        code: 'ASE',
        name: 'Los Cabos',
        country_code: 'US',
        city: 'Los Cabos',
        terminal: 'Terminal',
        region: 'NA'
      )

      airport.name = name

      airport.name
    end

    context 'And `name` is invalid' do
      def second_setup
        setup(name: 'a')
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And `name` is valid' do
      def second_setup
        setup(name: 'Los Angeles')
      end

      it 'Updates `name`' do
        name = second_setup

        expect(name).to eq('Los Angeles')
      end
    end
  end

  context 'When setting `country_code`' do
    def setup(country_code:)
      airport = Domain::Airport.new(
        id: '123',
        code: 'ASE',
        name: 'Los Cabos',
        country_code: 'US',
        city: 'Los Cabos',
        terminal: 'Terminal',
        region: 'NA'
      )

      airport.country_code = country_code

      airport.country_code
    end

    context 'And `country_code` is invalid' do
      def second_setup
        setup(country_code: 'a')
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And `country_code` is valid' do
      def second_setup
        setup(country_code: 'US')
      end

      it 'Updates `country_code`' do
        country_code = second_setup

        expect(country_code).to eq('US')
      end
    end
  end

  context 'When setting `city`' do
    def setup(city:)
      airport = Domain::Airport.new(
        id: '123',
        code: 'ASE',
        name: 'Los Cabos',
        country_code: 'US',
        city: 'Los Cabos',
        terminal: 'Terminal',
        region: 'NA'
      )

      airport.city = city

      airport.city
    end

    context 'And `city` is invalid' do
      def second_setup
        setup(city: 'a')
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And `city` is valid' do
      def second_setup
        setup(city: 'Los Angeles')
      end

      it 'Updates `city`' do
        city = second_setup

        expect(city).to eq('Los Angeles')
      end
    end
  end

  context 'When setting `terminal`' do
    def setup(terminal:)
      airport = Domain::Airport.new(
        id: '123',
        code: 'ASE',
        name: 'Los Cabos',
        country_code: 'US',
        city: 'Los Cabos',
        terminal: 'Terminal',
        region: 'NA'
      )

      airport.terminal = terminal

      airport.terminal
    end

    context 'And `terminal` is invalid' do
      def second_setup
        setup(terminal: '')
      end

      it 'Raises AirportValidationException' do
        expect { second_setup }.to raise_error(Domain::AirportValidationException)
      end
    end

    context 'And `terminal` is valid' do
      def second_setup
        setup(terminal: 'TERMINAL')
      end

      it 'Updates `terminal`' do
        terminal = second_setup

        expect(terminal).to eq('TERMINAL')
      end
    end
  end

  context 'When setting `region`' do
      def setup(region:)
        airport = Domain::Airport.new(
          id: '123',
          code: 'ASE',
          name: 'Los Cabos',
          country_code: 'US',
          city: 'Los Cabos',
          terminal: 'Terminal',
          region: 'NA'
        )
  
        airport.region = region
  
        airport.region
      end
  
      context 'And `region` is invalid' do
        def second_setup
          setup(region: 'a')
        end
  
        it 'Raises AirportValidationException' do
          expect { second_setup }.to raise_error(Domain::AirportValidationException)
        end
      end
  
      context 'And `region` is valid' do
        def second_setup
          setup(region: 'NA')
        end
  
        it 'Updates `region`' do
          region = second_setup
  
          expect(region).to eq('NA')
        end
      end
    end
end
