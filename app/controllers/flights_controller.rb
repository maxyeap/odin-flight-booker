class FlightsController < ApplicationController
  def index
    @unique_flight_dates = unique_flight_dates

    return if params[:num_tickets].nil?

    departure_code = params[:departure_code]
    arrival_code = params[:arrival_code]
    date = Date.strptime(params[:date], '%m/%d/%Y')
    @result = search_flight(departure_code, arrival_code, date)
  end

  def search_flight(departure_code, arrival_code, date)
    Flight.joins(:departure_airport, :arrival_airport)
          .where(departure_airport: { code: departure_code }, arrival_airport: { code: arrival_code })
          .and(Flight.where('start BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day))
  end

  def unique_flight_dates
    Flight.all.order(:start).map do |date|
      [date.start.strftime('%m/%d/%Y'), date.start.strftime('%m/%d/%Y')]
    end.uniq
  end
end

Date.strptime('05/13/2023', '%m/%d/%Y')
