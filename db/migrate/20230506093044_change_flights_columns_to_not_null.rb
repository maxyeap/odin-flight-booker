class ChangeFlightsColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :flights, :departure_airport_id, false
    change_column_null :flights, :arrival_airport_id, false
    change_column_null :flights, :start, false
    change_column_null :flights, :duration, false
  end
end
