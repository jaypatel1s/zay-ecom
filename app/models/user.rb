class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1
      edit_passwords_path
    else
      root_path
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :carts
  has_many :shoes, through: :carts

  validates :name,:city,:country,:mobile,:address,:postcode,  presence: true
  
end
