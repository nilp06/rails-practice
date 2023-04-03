class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
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

  def record_not_found
    render 'error'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date)
  end
end
