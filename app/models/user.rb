class User < ApplicationRecord
  
  validates :mobile, length: {minimum:9, maximum:10}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :carts
  has_many :shoes, through: :carts
end
