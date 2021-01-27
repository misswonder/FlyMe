class Passenger < ActiveRecord::Base

    has_many :tickets
    has_many :ticketed_flights, through: :tickets, source: :flight
end 