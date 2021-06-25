class Orders < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :confirmed, :boolean, default: :false
  	add_column :orders, :rejected, :boolean, default: :false
  end
end
