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

ActiveRecord::Schema[7.0].define(version: 2023_01_08_143913) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code", limit: 5, null: false
    t.string "name", limit: 50, null: false
    t.string "country_code", limit: 10, null: false
    t.string "city", limit: 50, null: false
    t.string "terminal", limit: 50, null: false
    t.string "region", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure_at", null: false
    t.datetime "arrival_at", null: false
    t.integer "seats", null: false
    t.integer "max_infants_allowed", null: false
    t.integer "max_pets_allowed", null: false
    t.integer "min_seats_threshold", null: false
    t.string "currency", limit: 10, null: false
    t.bigint "route_id", null: false
    t.string "number", limit: 10, null: false
    t.string "marketing_carrier_code", limit: 10, null: false
    t.decimal "adult_seat_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_flights_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["origin_id"], name: "index_routes_on_origin_id"
  end

  add_foreign_key "flights", "routes"
  add_foreign_key "routes", "airports", column: "destination_id"
  add_foreign_key "routes", "airports", column: "origin_id"
end
