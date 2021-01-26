class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :flight_id, :foreign_key => true
      t.integer :passenger_id, :foreign_key => true
      t.float :price
      t.integer :ticket_number 
      t.string :flight_status 
    end
  end
end
