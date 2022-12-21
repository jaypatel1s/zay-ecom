class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[ update destroy ]

  def index
    @carts = current_user.carts.active
  end   

  def new
    @cart = Cart.new
  end

  def create
    @cart = current_user.carts.build(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_url, notice: "Shoe successfully added to cart." }
      else
        format.html {redirect_to carts_url, notice: "Shoe already added in a cart"}
      end
    end
  end

  def update
    respond_to do |format|
      @cart.update(quantity: params[:quantity], size: params[:size])
      format.html { redirect_to carts_url, notice: "Cart successfully updated." } 
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "product successfully removed." }
    end
  end

  private
    def set_cart
      @cart = current_user.carts.find_by(id: params[:id])
    end

    def cart_params
      params.require(:cart).permit(:shoe_id, :quantity, :size, :is_active)
    end
    
end
