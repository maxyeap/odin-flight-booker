class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'

  validates :city, :code, presence: true

  def city_with_code
    "#{city} #{code}"
  end
end
