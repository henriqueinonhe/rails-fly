class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_at, null: false
      t.datetime :arrival_at, null: false
      t.integer :seats, null: false
      t.integer :max_infants_allowed, null: false
      t.integer :max_pets_allowed, null: false
      t.integer :min_seats_threshold, null: false
      t.string :currency, null: false, limit: 10
      t.references :route, foreign_key: { to_table: :routes }, null: false
      t.string :number, null: false, limit: 10
      t.string :marketing_carrier_code, null: false, limit: 10
      t.decimal :adult_seat_price, null: false
      t.timestamps
    end
  end
end
