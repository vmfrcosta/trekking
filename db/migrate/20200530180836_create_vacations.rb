class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.references :country, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
