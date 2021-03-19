class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @event = current_user.created_events.build(event_params) 
    if @event.save
      @event.attendees << current_user
      redirect_to root_path
      flash[:notice] = "Your event has been created"
    else
      render :new
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if @event.destroy
      redirect_to root_path
      flash[:notice] = 'your event has been deleted'
    else
      flash[:notice] = 'something happened'
    end
  end

  def attend
    @event = Event.find(params[:id])
    if current_user.id == @event.creator.id
      redirect_to root_path
      flash[:notice] = "You are already attending this event"
    else
      @event.attendees << current_user
      redirect_to root_path
      flash[:notice] = "You are now attending this event"
    end
  end

  private
  def event_params
    params.require(:event).permit(:description, :user_id, :event_id)
  end
end
