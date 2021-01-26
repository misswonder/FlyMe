class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :airline
      t.text :origin
      t.text :destination
      t.string :flight_date_time
    end
  end
end
