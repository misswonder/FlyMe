class Flight < ActiveRecord::Base
    
    has_many :tickets
    has_many :ticketed_passengers, through: :tickets, source: :passenger
end