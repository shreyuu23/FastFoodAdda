class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  mount_uploader :image,ImageUploader
end
