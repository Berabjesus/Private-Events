class EventsController < ApplicationController
  def index
    @events = Event.all.order('created_at DESc')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.valid? && @event.save
      redirect_to events_path, notice: 'Event Created Successfully'
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
