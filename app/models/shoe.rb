class Shoe < ApplicationRecord
  belongs_to :category
  has_many :carts
  has_many :users, through: :carts

  has_many :order_shoes, dependent: :destroy
  has_many :orders, through: :order_shoes

  has_one_attached :file

  validates :name, presence: true
  validates :price, presence: true
  validates :active, :size, presence: true
  SHOE_SIZES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  def self.search(search)
    @shoes = if search
               Shoe.where('name like ?', "%#{search}%")
             else
               Shoe.all
             end
  end
end
