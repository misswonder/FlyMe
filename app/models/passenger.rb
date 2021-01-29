class Passenger < ActiveRecord::Base
    
    has_many :tickets
    has_many :ticketed_flights, through: :tickets, source: :flight

   

    def self.new_user(result)
         name = Passenger.create(name: result[:name], age: result[:age])

    end

    def self.returning_user
            puts "Please insert your first and last name"
            name = gets.chomp.titlecase
            if Passenger.find_by(name: name)
                puts
                sleep(0.7)
                puts "Welcome back #{name}"
                $current_user = Passenger.find_by(name: name)
            else
                puts "Invalid Name, please insert your correct name"
                returning_user
            end
    end



end 