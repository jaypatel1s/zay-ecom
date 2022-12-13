class Order < ApplicationRecord
  belongs_to :user

  has_many :order_shoes
  has_many :shoes, through: :order_shoes

  validates :total, :discount, presence: true
end
