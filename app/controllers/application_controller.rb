class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :country, :mobile, :email, :password, :address, :postcode])
  end

  def check_is_admin_user
    unless current_user.is_admin?
      flash[:error] = "You can't create or update shoes details"
      redirect_to root_path
    end
  end
  
end
