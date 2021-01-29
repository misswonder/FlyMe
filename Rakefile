require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = nil
  Pry.start
end 

namespace :flight do

  desc 'read all the flight info'
  task :all do 
    Flight.all.each do |flight| 
      puts flight  
    end
  end 

  desc 'check the status while booking the flight'
  task :checkstatus, [:ticket_number] do |t, args|
   ticket = Ticket.find_by(ticket_number: args[:ticket_number])
    puts ticket.flight_status
  end 

  desc 'create a ticket from booking a flight'
  task :bookflight, [:ticket_number] do |t, args|
    ticket = Ticket.find_by(ticket_number: args[:ticket_number])
    puts ticket.price
  end 
end 

