class EventsController < ApplicationController
  before_action :authorized
  helper_method :events_user_attending, :test

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.valid? && @event.save
      redirect_to user_path(current_user), notice: 'Event Created Successfully'
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
