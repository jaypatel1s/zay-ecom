class Shoe < ApplicationRecord
  belongs_to :category
  has_many :carts
  has_many :users, through: :carts
  
  has_many :order_shoes, dependent: :destroy
  has_many :orders, through: :order_shoes

  has_one_attached :file

  validates :name, presence: true
  validates :price, presence: true
  validates :active, :size, presence:true  
end
