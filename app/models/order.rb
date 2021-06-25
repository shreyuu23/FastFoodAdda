class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
   belongs_to :restaurant
   # validates :name, presence: true
   # validates :address, presence: true
end
