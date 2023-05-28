class ApplicationController < ActionController::Base
  helper_method :is_admin?
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  private

  def is_admin?
    current_user.role == 'admin'
  end

  def set_layout
    if user_signed_in?
      current_user.role
    else
      'application'
    end
  end

  def check_admin?
    return if is_admin?

    redirect_to products_path, flash: { danger: 'You have not Acess to this page.' }
  end
  
end
