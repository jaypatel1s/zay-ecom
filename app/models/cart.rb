class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

   before_save :set_quantity
   
   validates :quantity, numericality: true, allow_blank: true
   validate :is_active_cart_present?

   scope :active, -> { where(is_active: true) }

   def set_quantity
      self.quantity = self.quantity.present? ? self.quantity : 1 
      self.size = self.size.present? ? self.size : 8 
   end     

   
   def is_active_cart_present?
      cart = Cart.find_by(shoe_id: self.shoe_id, user_id: self.user_id, is_active: true)
      if cart.present?
        errors.add(:base, 'Shoe already added to cart')
      end
   end
end   