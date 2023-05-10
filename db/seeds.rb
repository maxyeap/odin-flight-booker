# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Define an array of airports with city names and codes
airports = [
  { code: 'KUL', city: 'Kuala Lumpur' },
  { code: 'JFK', city: 'New York' },
  { code: 'LAX', city: 'Los Angeles' },
  { code: 'ORD', city: 'Chicago' },
  { code: 'DFW', city: 'Dallas' },
  { code: 'DEN', city: 'Denver' },
  { code: 'MIA', city: 'Miami' },
  { code: 'SFO', city: 'San Francisco' },
  { code: 'LAS', city: 'Las Vegas' },
  { code: 'CLT', city: 'Charlotte' },
  { code: 'ATL', city: 'Atlanta' }
]

# Loop through the array and create an Airport object for each code and city
airports.each do |airport|
  Airport.create(city: airport[:city], code: airport[:code])
end

# Get an array of all airport IDs
airport_ids = Airport.pluck(:id)

# Loop 10 times to create 10 flights
100.times do
  # Get two random airport IDs that are not the same
  departure_id = airport_ids.sample
  arrival_id = airport_ids.reject { |id| id == departure_id }.sample

  # Generate a random datetime object for the start time (between 1 hour and 7 days from now)
  start_time = Time.current + rand(1.hour..30.days)

  # Generate a random duration between 1 and 6 hours
  duration = rand(180..840)

  # Create the flight with the generated attributes
  Flight.create!(
    departure_airport_id: departure_id,
    arrival_airport_id: arrival_id,
    start: start_time,
    duration:
  )
end
