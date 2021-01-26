# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_26_175128) do

  create_table "flights", force: :cascade do |t|
    t.string "airline"
    t.text "origin"
    t.text "destination"
    t.integer "flight_date"
    t.integer "flight_time"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "flight_id"
    t.integer "passenger_id"
    t.float "price"
    t.integer "ticket_number"
    t.string "flight_status"
  end

end
