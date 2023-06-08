class SessionsController < ApplicationController
  skip_before_action :authenticate_user, except: :destroy
  before_action :redirect_if_authenticated, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user]&.[](:email))
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      cookies[:user_name] = @user.name
      redirect_to root_path, flash: { success: 'Logged in successfully' }
    else
      redirect_to new_session_path, flash: { danger: 'Email or Password Invalid.' }
    end
  end

  def destroy
    session.delete :user_id
    cookies.delete :user_name
    redirect_to root_path, flash: { success: 'Logged Out.' }
  end
end
