class ProfilesController < ApplicationController
  before_action :check_user

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, flash: { danger: 'Something went wrong.' }, status: :unprocessable_entity
    end
  end

  def show
    @enrollments = current_user.enrollments
    @profile = Profile.find(params[:id])
    @address = Address.find_by(user_id: current_user.id)
  end

  private

  def check_user
    return unless params[:id].to_i != current_user.profile.id

    redirect_to root_path, flash: { danger: 'You have not access to this page.' }
  end

  def profile_params
    params.require(:profile).permit(:name, :email, :dob, :bio)
  end
end
