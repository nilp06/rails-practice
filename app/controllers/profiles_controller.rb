class ProfilesController < ApplicationController
  before_action :authenticate_user
  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Event.find(params[:id])

    if @profile.update(event_params)
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
