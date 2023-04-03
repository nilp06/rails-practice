class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to new_session_path, flash: { danger: 'You must be logged in.' } if current_user.nil?
  end
end
