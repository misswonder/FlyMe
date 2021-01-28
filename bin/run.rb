require_relative '../config/environment'


require "tty-prompt"

prompt = TTY::Prompt.new


puts "HELLO WORLD" 

# # prompt.ask("Hello Welcome to Flight App?", default: ENV["USER"])
# # prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

# choices = %w(Flight_Options Book_a_Flight Update_Your_Flight Cancel_a_Flight)
# prompt.multi_select("Select an Option?", choices)


 f1 =  Flight.first
 p1 = Passenger.first
 t1 = Ticket.first









binding.pry