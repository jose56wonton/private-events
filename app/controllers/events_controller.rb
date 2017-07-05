class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Created!"
      redirect_to events_path
    else
      flash[:success] = "Invalid event"
      render 'static_pages/home'
    end
  end
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end


  private
    def event_params
      params.require(:event).permit(:title,:date,:location)
    end

end
