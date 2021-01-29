class Ticket < ActiveRecord::Base
    belongs_to :flight
    belongs_to :passenger

    def ticket_info
        "ticket: #{ticket_number}, #{flight.flight_info}"
    end
end 