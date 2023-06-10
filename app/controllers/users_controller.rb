class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]
  before_action :redirect_if_authenticated, only: %i[new create]
  before_action :set_user, only: %i[edit update]
  before_action :is_owner?, only: %i[edit update]

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

  def edit; end

  def update
    @user.old_email = @user.email
    if @user.update(user_params)
      redirect_to users_path, flash: { success: 'Successfully  Updated profile.' }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def is_owner?
    return if @user == current_user

    redirect_to root_path, flash: { danger: 'You have not access to this page.' }
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
