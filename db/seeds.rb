# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Define an array of airports with city names and codes
airports = [
  { code: 'SIN', city: 'Singapore' },
  { code: 'KUL', city: 'Kuala Lumpur' },
  { code: 'BKK', city: 'Bangkok' },
  { code: 'HKG', city: 'Hong Kong' },
  { code: 'MNL', city: 'Manila' },
  { code: 'CGK', city: 'Jakarta' },
  { code: 'HAN', city: 'Hanoi' },
  { code: 'DPS', city: 'Denpasar' },
  { code: 'PNH', city: 'Phnom Penh' },
  { code: 'RGN', city: 'Yangon' },
  { code: 'KTM', city: 'Kathmandu' }
]

# Loop through the array and create an Airport object for each code and city
airports.each do |airport|
  Airport.create(city: airport[:city], code: airport[:code])
end

# Get an array of all airport IDs
airport_ids = Airport.pluck(:id)

# Loop through the airport_ids to create flights
airport_ids.each do |departure_id|
  airport_ids.each do |arrival_id|
    next if departure_id == arrival_id # skip if departure and arrival airport are the same

    10.times do |i|
      start_time = Time.current + i.days + rand(1.hour..7.days) # start_time is between 1 hour and 7 days from now
      duration = rand(180..840) # duration is between 3 and 14 hours
      Flight.create!(
        departure_airport_id: departure_id,
        arrival_airport_id: arrival_id,
        start: start_time,
        duration:
      )
    end
  end
end
