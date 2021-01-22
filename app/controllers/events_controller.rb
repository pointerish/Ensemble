# rubocop:disable Style/GuardClause

class EventsController < ApplicationController
  include EventsHelper
  before_action :logged_in_user, only: %i[new create]

  def index
    @events = Event.all
    @up_events = Event.upcoming
    @prev_events = Event.previous
  end

  def show
    @event = Event.find(params[:id])
    @attendants = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_args)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy; end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    @event.save
    redirect_to root_path
  end

  private

  def event_args
    params.require(:event).permit(:name, :location, :date)
  end

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to index
    end
  end
end

# rubocop:enable Style/GuardClause
