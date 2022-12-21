class Order < ApplicationRecord
  belongs_to :user

  has_many :order_shoes, dependent: :destroy
  # has_many :shoes, through: :order_shoes
  
  validates :total, :discount, presence: true

  after_commit :inactivate_user_carts

  def inactivate_user_carts
    self.user.carts.update_all(is_active: false)
  end
end
