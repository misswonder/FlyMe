
Flight.destroy_all
Passenger.destroy_all
Ticket.destroy_all



f1 = Flight.create(airline: "Delta Airline", origin: "New York City", destination: "Los Angeles", flight_date_time: "January 30th, 2021, 2:30PM")
f2 = Flight.create(airline: "American Airline", origin: "Boston", destination: "Seattle", flight_date_time: "February 1st, 2021, 9:00AM")
f3 = Flight.create(airline: "United Airline", origin: "San Francisco", destination: "Denver", flight_date_time: "January 31st, 2021, 11:30AM")
f4 = Flight.create(airline: "South West", origin: "Washington DC", destination: "Miami", flight_date_time: "February 1st, 2021, 1:00PM")
f5 = Flight.create(airline: "Alaska Airline", origin: "Portland", destination: "San Diego", flight_date_time: "January 29th, 2021, 10:30AM")
f6 = Flight.create(airline: "JetBlue Airline", origin: "Dallas", destination: "Atlanta", flight_date_time: "February 2nd, 2021, 8:30AM")
f7 = Flight.create(airline: "Hawaiian Airlines ", origin: "Hawai", destination: "Austin", flight_date_time: "February 4th, 2021, 12:30PM")
f8 = Flight.create(airline: "Delta", origin: "Dallas", destination: "Houston", flight_date_time: "January 31th, 2021, 4:30PM")
f9 = Flight.create(airline: "American Airline", origin: "South Carolina", destination: "New Orleans", flight_date_time: "February 5th, 2021, 3:30PM")
f10 = Flight.create(airline: "United Airline", origin: "Phoenix", destination: "New York City", flight_date_time: "January 31st, 2021, 11:30AM")


p1 = Passenger.create(name: "Hanna Mulugeta", age: 25)
p2 = Passenger.create(name: "Michelle Obamma", age: 35)
p3 = Passenger.create(name: "Yvonne Chen", age: 20)
p4 = Passenger.create(name: "Kevin Calvin", age: 23)
p5 = Passenger.create(name: "Michael Robin", age: 45)
p6 = Passenger.create(name: "Stevin Jones", age: 6)
p7 = Passenger.create(name: "Jimmiy Jacson", age: 55)
p8 = Passenger.create(name: "Arial Kim", age: 18)
p9 = Passenger.create(name: "Maria Carrey", age: 42)
p10 = Passenger.create(name: "Alex Bob", age: 9)
p11 = Passenger.create(name: "David Chou", age: 49)


t1 = Ticket.create(flight: f1, passenger: p1, price: 300.00, ticket_number: 11160, flight_status: "Open")
t2 = Ticket.create(flight: f2, passenger: p1, price: 250.00, ticket_number: 11161, flight_status: "Open")
t3 = Ticket.create(flight: f3, passenger: p2, price: 450.00, ticket_number: 11162, flight_status: "Open")
t4 = Ticket.create(flight: f3, passenger: p3, price: 400.00, ticket_number: 11163, flight_status: "Open")
t5 = Ticket.create(flight: f4, passenger: p4, price: 350.00, ticket_number: 11164, flight_status: "Open")
t6 = Ticket.create(flight: f5, passenger: p5, price: 250.00, ticket_number: 11165, flight_status: "Open")
t7 = Ticket.create(flight: f6, passenger: p6, price: 200.00, ticket_number: 11166, flight_status: "Open")
t8 = Ticket.create(flight: f3, passenger: p7, price: 400.00, ticket_number: 11167, flight_status: "Open")
t9 = Ticket.create(flight: f7, passenger: p6, price: 350.00, ticket_number: 11168, flight_status: "Open")
t10 = Ticket.create(flight: f8, passenger: p8, price: 250.00, ticket_number: 11169, flight_status: "Open")
t11 = Ticket.create(flight: f9, passenger: p9, price: 350.00, ticket_number: 11170, flight_status: "Open")
