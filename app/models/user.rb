class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :restaurant
  has_many :orders
  belongs_to :role

   USER_ROLES = {"Admin" => 1, "User" => 2, "Resto" => 3}

end
