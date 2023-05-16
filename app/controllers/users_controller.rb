class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]
  before_action :redirect_if_authenticated, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies[:user_name] = @user.name
      redirect_to root_path, flash: { success: 'Logged in Successfully.' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
