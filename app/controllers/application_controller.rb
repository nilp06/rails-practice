class ApplicationController < ActionController::Base
  before_action :authenticate_user
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    return unless current_user.nil?

    flash[:danger] = 'You must be logged in.'
    redirect_to new_session_path
  end

  def redirect_if_authenticated
    redirect_to root_path, flash: { info: 'You are already logged in.' } if user_signed_in?
  end
end
