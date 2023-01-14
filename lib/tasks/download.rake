require 'net/http'
require 'json'

namespace :import do
  desc 'Imports airports from Darwin'
  task airports: :environment do
    uri = URI('https://membrane-staging.aero.com/api/System/airports')
    response = Net::HTTP.get(uri, {
                               "N1-Version": '1.1'
                             }, 443)
    darwin_airports = JSON.parse(response)

    darwin_airports.each do |darwin_airport|
      create_airport_dto = Domain::CreateAirportDto.new(
        code: darwin_airport['airportCode'],
        country_code: darwin_airport['countryCode'],
        terminal: darwin_airport['airportTerminals'][0]['translations'][0]['translationText'],
        name: darwin_airport['airportNames'][0]['translationText'],
        city: darwin_airport['cityNames'][0]['translationText'],
        region: darwin_airport['region']
      )
      Infrastructure::AirportsRepository.create_airport(create_airport_dto)
    end
  end

  desc "Imports routes from Darwin" do
    task routes: :environment do
      
  end
end
