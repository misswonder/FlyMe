class Flight < ActiveRecord::Base
    
    has_many :tickets
    has_many :ticketed_passengers, through: :tickets, source: :passenger

    def self.view_flights_option
        Flight.all
    end 
    
end