class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code, limit: 5, null: false
      t.string :name, limit: 50, null: false
      t.string :country_code, limit: 10, null: false
      t.string :city, limit: 50, null: false
      t.string :terminal, limit: 50, null: false
      t.string :region, limit: 10, null: false
      t.timestamps
    end
  end
end
