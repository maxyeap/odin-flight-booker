class AddAirportReferencesToFlights < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
