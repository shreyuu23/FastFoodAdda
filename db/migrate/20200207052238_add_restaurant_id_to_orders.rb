class AddRestaurantIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :restaurant_id, :string
  end
end
