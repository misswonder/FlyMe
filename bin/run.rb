require_relative '../config/environment'

require "tty-prompt"


prompt = TTY::Prompt.new

@@current_user = nil
@@flight_option = nil

puts "Welcome to FlyMe!!" 
puts
sleep(1)

# Login or Signup prompt

        prompt.select("Are you a New or Returning User?") do |menu|
        menu.choice "New", -> {
        result = prompt.collect do
            key(:name).ask("What is your first and last name?")
            key(:age).ask("Age?", convert: :int)
                end
        @@current_user = Passenger.new_user(result)}

        menu.choice "Returning", -> {@@current_user = Passenger.returning_user}
        end    

        def view_flights_option
            Flight.all
            option = TTY::Prompt.new.collect do 
                    key(:id).ask("Please insert your flight id?") 
                    end 
            @@flight_option = Flight.find_by(id: option)
        end 

        def book_flight
        Ticket.create(flight: @@flight_option, passenger: @@current_user, price: 300.00, ticket_number: (Ticket.last.ticket_number + 1), flight_status: "Open")
        end 


        def exit_flyme
            puts 'Thank you for visiting us, hava a nice day!'
        end 


        def selected_option
            while true
                selected_option = TTY::Prompt.new.select("How can we help you Today?") do |menu|
                        menu.choice "View_Flights_Option" 
                        menu.choice "Book_Flights"
                        menu.choice "Change_Flight"
                        menu.choice "Cancel_Flight"
                        menu.choice "exit"
                        end

                return exit_flyme if selected_option == "exit"      
                
                case selected_option
                
                when "View_Flights_Option"
                    view_flights_option
                
                when "Book_Flights"
                    book_flight
                
                when "change_Flights"
                    option = TTY::Prompt.new.collect do 
                        key(:id).ask("Please insert your ticket_number?") 
                        end
                    current_ticket = Ticket.find_by(id: option)

                    view_flights_option
                    book_flight

                when "Cancel_Flight"
                    option = TTY::Prompt.new.collect do 
                        key(:id).ask("Please insert your ticket_number?") 
                        end
                    current_ticket = Ticket.find_by(id: option)
                    current_ticket.destroy 
                else
                    puts "Invalid input"
                end 
            end 
        end 

selected_option                         
binding.pry

