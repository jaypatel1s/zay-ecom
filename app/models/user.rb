class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :carts
  has_many :shoes, through: :carts

  # validates :name, presence: true
  # validates :mobile, length: {minimum:9, maximum:10}
end
