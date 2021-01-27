require_relative '../config/environment'



puts "HELLO WORLD"

p1= Passenger.find(1)
p1.ticketed_flights
p1.tickets

f1 = Flight.find(23)
f1.tickets
f1.ticketed_passengers

 









binding.pry