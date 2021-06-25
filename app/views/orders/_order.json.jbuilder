json.extract! order, :id, :name, :address, :email, :mobile, :quantity, :total_price, :item_id, :created_at, :updated_at
json.url order_url(order, format: :json)
