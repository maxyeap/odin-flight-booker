class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings

  validates :departure_airport_id, :arrival_airport_id, presence: true
  validate :different_departure_and_arrival

  def flight_date_formatted
    start.strftime('%m/%d/%Y')
  end

  def to_str
    "#{start.to_date} #{departure_airport.code} -> #{arrival_airport.code}\n
    #{start.strftime('%H:%M')} to #{(start + (duration * 60)).strftime('%H:%M')} (#{duration / 60}h #{duration % 60}m)
    "
  end

  private

  def different_departure_and_arrival
    return unless departure_airport_id == arrival_airport_id

    errors.add(:arrival_airport_id, 'must be different from departure airport')
  end
end
