class OrderShoesController < ApplicationController
  before_action :set_order_shoe, only: %i[ show edit update destroy ]

  # GET /order_shoes or /order_shoes.json
  def index
    @order_shoes = OrderShoe.all
  end

  # GET /order_shoes/1 or /order_shoes/1.json
  def show
  end

  # GET /order_shoes/new
  def new
    @order_shoe = OrderShoe.new
  end

  # GET /order_shoes/1/edit
  def edit
  end

  # POST /order_shoes or /order_shoes.json
  def create
    @order_shoe = OrderShoe.new(order_shoe_params)

    respond_to do |format|
      if @order_shoe.save
        format.html { redirect_to order_shoe_url(@order_shoe), notice: "Order shoe was successfully created." }
        format.json { render :show, status: :created, location: @order_shoe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_shoes/1 or /order_shoes/1.json
  def update
    respond_to do |format|
      if @order_shoe.update(order_shoe_params)
        format.html { redirect_to order_shoe_url(@order_shoe), notice: "Order shoe was successfully updated." }
        format.json { render :show, status: :ok, location: @order_shoe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_shoes/1 or /order_shoes/1.json
  def destroy
    @order_shoe.destroy

    respond_to do |format|
      format.html { redirect_to order_shoes_url, notice: "Order shoe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_shoe
      @order_shoe = OrderShoe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_shoe_params
      params.require(:order_shoe).permit(:order_id, :shoe_id, :price, :discount, :active)
    end
end
