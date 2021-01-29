class Flight < ActiveRecord::Base
  has_many :tickets
  has_many :ticketed_passengers, through: :tickets, source: :passenger

  def flight_info
    "airline: #{airline}, origin: #{origin}, destination: #{destination}, flight_date_time: #{flight_date_time}"
  end
  
end
