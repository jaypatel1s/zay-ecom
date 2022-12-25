class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
                                                
  def index
    @user_orders = current_user.orders
  end

  def show
    @order_shoes = @order.order_shoes
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    if current_user.carts.present? && 
      @order = current_user.orders.build(order_params)
      respond_to do |format|      
        if @order.save
          quantity_size_array = params[:test].as_json.to_a
          quantity_size_array.each_slice(2) do |qs|
            cart_id = qs.first.first.scan(/\d/).join('')
            cart = Cart.find_by(id: cart_id)
            next if cart.blank?

            @order.order_shoes.create(cart_id: cart.id, shoe_id: cart.shoe_id, 
              price: cart.shoe.price, discount: cart.shoe.discount, active: true, 
              quantity: qs.first.last, size: qs.last.last
            ) 
        end      
      
          format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private

    def set_order
      @order = Order.find_by(id: params[:id])
      unless @order.present?
        redirect_to root_path, notice: 'Order not found'
      end
    end
                                        
    def order_params
      params.require(:order).permit(:user_id, :total, :discount, :name, :email, :address, :pay_method, :terms_and_conditions)
    end
end 
