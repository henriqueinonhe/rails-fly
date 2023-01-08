require 'net/http'
require 'json'

routes = Route.all

flights = []

routes.each do |route|
  uri = URI("https://membrane-staging.aero.com/api/flightSearchResults?originIata=#{route.origin.code}&destinationIata=#{route.destination.code}")
  response = Net::HTTP.get(uri, {}, 443)
  serialized_flights = JSON.parse(response)

  serialized_flights.each do |serialized_flight|
    flights.append Flight.new(
      departure_at: serialized_flight['departureAt'],
      arrival_at: serialized_flight['arrivalAt'],
      seats: 16,
      max_infants_allowed: 2,
      max_pets_allowed: 2,
      min_seats_threshold: 0,
      currency: serialized_flight['currency'],
      route:,
      number: serialized_flight['flightNumber'],
      marketing_carrier_code: serialized_flight['marketingCarrierCode'],
      adult_seat_price: serialized_flight['price'].to_f
    )
  end
end

flights.uniq! { |flight| "#{flight[:departure_at]} #{flight[:number]}" }

flights.each do |flight|
  flight.save
end
