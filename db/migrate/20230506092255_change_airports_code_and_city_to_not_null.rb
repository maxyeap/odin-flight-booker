class ChangeAirportsCodeAndCityToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :airports, :code, false
    change_column_null :airports, :city, false
  end
end
