class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :carts
  has_many :shoes

  validates :name,:city,:country,:mobile,:address,:postcode,  presence: true

  def is_admin?
    self.is_admin == true
  end

  def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1
      edit_passwords_path
    else
      root_path 
    end
  end

  def cart_total
    self.carts.active.map { |cc| cc.shoe.price }.sum 
  end

    
  def calculate_discount_amount
    self.carts.active.map { |cc| cc.shoe.discount }.sum
  end

  def cart_total_with_discount
    self.cart_total - self.calculate_discount_amount
  end

end
