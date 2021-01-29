require_relative '../config/environment'

require "tty-prompt"

$current_user = nil
$flight_option = nil

prompt = TTY::Prompt.new

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
            $current_user = Passenger.new_user(result)
             puts
             prompt.mask("Thank you for Signing up #{$current_user.name}, press ENTER to continue")}

        menu.choice "Returning", -> {$current_user = Passenger.returning_user}
           end    

# CRUD Methods 
        def view_flights_option
                prompt = TTY::Prompt.new
                prompt.select("Choose your new Flight?") do |menu|
                menu.choice "Enter here to view Flight Options", -> {Flight.all.collect{|flight| p flight}}
                        end
                puts
                sleep(1)
                option = TTY::Prompt.new.collect do 
                key(:id).ask("Please insert a flight id to book?") 
                        end 
                $flight_option = Flight.find_by(id: option[:id])
                puts
                sleep(1)
                p $flight_option
                puts
                prompt = TTY:: Prompt.new
                prompt.mask("Your selected flight id is #{$flight_option.id}, press ENTER to Book")
                puts
        end 

        def book_flight
                new_ticket = Ticket.create(flight: $flight_option, passenger: $current_user, price: 300.00, ticket_number: (Ticket.last.ticket_number + 1), flight_status: "Open")
                puts "Your ticket is being generated, please wait ..."
                sleep(1)
                p new_ticket
                puts 
                sleep(1)
                prompt = TTY:: Prompt.new
                prompt.mask("Your new ticket number is #{new_ticket.ticket_number}, press ENTER continue")
        end 


        def exit_flyme
                puts
                sleep(1)
                puts 'Thank you for visiting us, hava a nice day!'
        end 

# CRUD Action loop

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
                
                when "Change_Flight"
                        puts
                        prompt = TTY::Prompt.new
                        prompt.yes?("Are you sure you want to change your ticket?")
                        option = TTY::Prompt.new.collect do 
                        key(:id).ask("Please insert your ticket_number?") 
                                end
                        current_ticket = Ticket.find_by(ticket_number: option[:id])
                         
                        puts
                        sleep(1)     
                        view_flights_option
                        book_flight
                        puts 
                        sleep(1)
                        current_ticket.destroy()  
                        prompt = TTY:: Prompt.new
                        prompt.mask("Your ticket #{current_ticket.ticket_number} has been changed, press ENTER to continue")

                when "Cancel_Flight"
                         option = TTY::Prompt.new.collect do 
                        key(:id).ask("Please insert your ticket_number?") 
                                end
                        current_ticket = Ticket.find_by(ticket_number: option[:id])
               
                        current_ticket.destroy()
                         prompt = TTY:: Prompt.new
                        prompt.mask("Your ticket #{current_ticket.ticket_number} has been cancelled, press ENTER to continue")
                    
                else
                        puts "Invalid input"
                end 
            end 
        end 


sleep(1)
puts
selected_option                         
# binding.pry

