class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to event_event_sections_path(@event),
                  notice: 'Event was successfuly created.'
    else
      render :new
    end
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to events_path,
                notice: 'Event was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to my_events_path,
                notice: 'Event was successfuly destroyed.'
  end

  def my
    @events = current_user.events
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :date,
      :end_date,
      :url,
      :logo
    )
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to events_path
  end
end
