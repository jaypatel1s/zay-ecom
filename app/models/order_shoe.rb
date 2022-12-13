class OrderShoe < ApplicationRecord
  belongs_to :order
  belongs_to :shoe

  belongs_to :cart
end
