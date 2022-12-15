class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

   has_many :order_shoes, dependent: :destroy
   has_many :shoes, through: :order_shoes

      
   validates :quantity, numericality: true, allow_blank: true
   validates :shoe_id, uniqueness: {scope: :user_id}

  
   def set_quantity
      return if quantity.present?
      self.quantity = 1 
   end  
    
   def size
      self.size = 8
   end
end
