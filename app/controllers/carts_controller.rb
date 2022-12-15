class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[ update destroy ]
  # GET /carts or /carts.json
  def index
    @carts = current_user.carts
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # POST /carts or /carts.json
  def create
    # @cart = Cart. new(cart_params)
    @cart = current_user.carts.create(shoe_id: params[:shoe_id])
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_url, notice: "product was successfully added to cart." }
        # format.json { render :index, status: :created, location: @cart }
      else
        format.html {redirect_to carts_url, notice: "product already added in a cart"}
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    @cart.update(cart_params)
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully upadted." } 
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "product was successfully removed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = current_user.carts.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :shoe_id, :quantity, :size)
    end

    
end
