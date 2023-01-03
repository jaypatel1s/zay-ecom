class ShoesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin_user, except: %i[index show]
  before_action :set_shoe, only: %i[show edit update destroy]

  def index
    @shoes = Shoe.search(params[:search])
  end

  def show; end

  def new
    @shoe = Shoe.new
  end

  def edit; end

  def create
    @shoe = Shoe.new(shoe_params)

    respond_to do |format|
      if @shoe.save
        SendNotificationsJob.perform_now(@shoe)
        format.html { redirect_to shoe_url(@shoe), notice: 'Shoe was successfully created.' }
        format.json { render :show, status: :created, location: @shoe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        SendNotificationsJob.perform_now(@shoe)
        format.html { redirect_to shoe_url(@shoe), notice: 'Shoe was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shoe.destroy

    respond_to do |format|
      format.html { redirect_to shoes_url, notice: 'Shoe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_shoe
    @shoe = Shoe.find_by(id: params[:id])
    return if @shoe.present?

    redirect_to root_path, notice: 'Shoe not found'
  end

  def shoe_params
    params.require(:shoe).permit(:category_id, :name, :brand, :size, :active, :price, :discount, :file, :search)
  end
end
