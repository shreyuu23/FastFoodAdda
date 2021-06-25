json.extract! item, :id, :name, :description, :image, :restaurant_id, :created_at, :updated_at
json.url item_url(item, format: :json)
