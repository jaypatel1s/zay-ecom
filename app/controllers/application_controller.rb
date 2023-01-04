class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name city country mobile email password address postcode])
  end

  def check_is_admin_user
    return if current_user.is_admin?

    flash[:error] = "You can't create or update shoes details"
    redirect_to root_path
  end

  def set_locale
    # puts '----'
    # puts params[:locale]
    # puts session[:locale]
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    puts I18n.locale
    # puts '----'
    session[:locale] = params[:locale]
  end

  def default_url_options(_options = {})
    { locale: I18n.locale }
  end
end
