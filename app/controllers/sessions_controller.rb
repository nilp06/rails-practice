class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      cookies[:user_id] = @user.email
      redirect_to root_path, flash: { success: 'Logged in successfully' }
    else
      flash[:danger] = 'Email or password is invalid.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:user_id)
    redirect_to root_path, flash: { success: 'Logged Out' }
  end
end
