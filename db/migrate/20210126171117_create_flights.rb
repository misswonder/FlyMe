class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :airline
      t.text :origin
      t.text :destination
      t.integer :flight_date
      t.integer :flight_time
    end
  end
end
