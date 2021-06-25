class Restaurant < ApplicationRecord
  belongs_to :area
  belongs_to :user
  has_many :items
  has_many :orders
  mount_uploader :image,ImageUploader
end
