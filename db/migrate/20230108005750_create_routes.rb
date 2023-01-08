class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :origin, foreign_key: { to_table: :airports }, null: false
      t.references :destination, foreign_key: { to_table: :airports }, null: false
      t.timestamps
    end
  end
end
