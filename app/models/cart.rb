class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

  before_save :set_quantity

  validates :quantity, numericality: true, allow_blank: true
  validate :is_active_cart_present?

  scope :active, -> { where(is_active: true) }

  def set_quantity
    self.quantity = quantity.present? ? quantity : 1
    self.size = size.present? ? size : 8
  end

  def is_active_cart_present?
    cart = Cart.find_by(shoe_id:, user_id:, is_active: true)
    return unless cart.present?

    errors.add(:base, 'Shoe already added to cart')
  end
end
