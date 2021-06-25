class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :mobile
      t.integer :quantity
      t.float :total_price
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
