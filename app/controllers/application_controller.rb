class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  end

  def logged_in_user
  return if user_signed_in?
    flash.now[:danger] = "Please log in."
    redirect_to login_url
  end

  def all_categories
    @categories = Category.all
  end
end
