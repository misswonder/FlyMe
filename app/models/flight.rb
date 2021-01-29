class Flight < ActiveRecord::Base
    

    has_many :tickets
    has_many :ticketed_passengers, through: :tickets, source: :passenger

    def view_flight
        self.all
    end
    # binding.pry
end