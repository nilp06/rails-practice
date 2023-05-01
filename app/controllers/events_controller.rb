class EventsController < ApplicationController
  def index
    @events = Event.all.order(id: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner_name = current_user.name
    if @event.save
      enrollment = Enrollment.new(user_id: current_user.id, event_id: @event.id, is_owner: true)
      enrollment.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path, status: :see_other
  end

  def enroll
    @enroll = Enrollment.new(user_id: current_user.id, event_id: params[:id], is_owner: false)
    if !@enroll.present? && @enroll.save
      flash[:success] = 'Successfully Enrolled in Event.'
    else
      flash[:danger] = 'You already enrolled in this Event.'
    end
    redirect_to events_path
  end

  def currentuser_event
    @enrollments = current_user.enrollments.where(is_owner: true)
    render 'currentuser_events'
  end

  def enrollments
    @enrollments = current_user.enrollments
  end

  def filter
    @events = Event.where(category_id: params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id)
  end
end
