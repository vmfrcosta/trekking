class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.references :origin_city, null: false, foreign_key: { to_table: :cities }
      t.references :origin_country, null: false, foreign_key: { to_table: :countries }
      t.references :destiny_city, null: false, foreign_key: { to_table: :cities }
      t.references :destiny_country, null: false, foreign_key: { to_table: :countries }
      t.datetime :departure_date
      t.datetime :departure_time
      t.datetime :arrival_date
      t.datetime :arrival_time
      t.integer :price
      t.string :description
      t.string :title
      t.references :vacation, foreign_key: true

      t.timestamps
    end
  end
end
