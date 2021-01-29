require_relative '../config/environment'

require 'tty-prompt'

prompt = TTY::Prompt.new

@current_user = nil

puts 'Welcome to FlyMe!!'
puts
sleep(1)


prompt.select('Are you a New or Returning User?') do |menu|
  menu.choice 'New', -> {
                       result = prompt.collect do
                         key(:name).ask('What is your first and last name?')
                         key(:age).ask('Age?', convert: :int)
                       end
                       @current_user = Passenger.new_user(result)
                     }

  menu.choice 'Returning', -> { @current_user = Passenger.returning_user }
end

def select_flight
  
  flights = Flight.all
  
  TTY::Prompt.new.select('Which flight would you like to book?') do |menu|
    flights.each do |flight|
      menu.choice flight.flight_info, -> { flight }
    end
  end
end

def select_ticket(text)
  tickets = @current_user.tickets

  if tickets.empty?
    return nil
  end

  TTY::Prompt.new.select(text) do |menu|
    tickets.each do |ticket|
      menu.choice ticket.ticket_info, -> { ticket }
    end
  end
end

def book_flight
  flight = select_flight

  Ticket.create(flight: flight, passenger: @current_user, price: 300.00,
    ticket_number: (Ticket.last.ticket_number + 1), flight_status: 'Open')

  @current_user.reload

  puts 'Your flight has been booked!'
end

def view_tickted_flights

  tickets = @current_user.tickets
    
  if tickets.empty?
    puts "You have no ticketed flights."
  else
    tickets.each do |ticket|
      puts ticket.ticket_info
    end
  end
end

def change_flight
  ticket = select_ticket('Which flight would you like to change?')

  if ticket.nil?
    puts "Sorry, you have no ticketed flights."
  else
    new_flight = select_flight
    ticket.update!(flight: new_flight)
    @current_user.reload
    puts "Your flight has been changed!"
  end
end

def cancel_flight
  ticket = select_ticket('Which flight would you like to cancel?')

  if ticket.nil?
    puts "Sorry, you have no ticketed flights."
  else
    ticket.destroy!
    @current_user.reload
    puts "Your flight has been cancelled"
  end
end

def exit_flyme
  puts 'Thank you for visiting us, hava a nice day!'
end

while true
  selected_option = TTY::Prompt.new.select('How can we help you Today?') do |menu|
    menu.choice 'View Ticketed Flights'
    menu.choice 'Book Flight'
    menu.choice 'Change Flight'
    menu.choice 'Cancel Flight'
    menu.choice 'exit'
  end

  return exit_flyme if selected_option == 'exit'

  case selected_option

  when 'Book Flight'
    book_flight
  when 'View Ticketed Flights'
    view_tickted_flights
  when 'Change Flight'
    change_flight
  when 'Cancel Flight'
    cancel_flight
  else
    puts 'Invalid input'
  end
end

