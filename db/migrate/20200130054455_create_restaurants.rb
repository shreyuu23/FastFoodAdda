class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.text :image
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
