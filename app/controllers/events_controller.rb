class EventsController < ApplicationController
  
  include SessionsHelper 
  before_action :logged_in?, only: [:create]

  def index
    @events = Event.all
  end

  def show
    # @event = current_user.created_events.find(params[:id]) 
    @event = Event.find(params[:id]) 
    #@attendees = current_user.created_events 
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params) 
    if @event.save 
      flash[:notice] = 'Event created' 
      redirect_to @event 
    else 
      render :new 
    end 
  end

  private
  def event_params
    params.require(:event).permit(:date, :description, :location)
  end
end
