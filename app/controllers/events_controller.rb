# rubocop:disable Style/GuardClause

class EventsController < ApplicationController
  include EventsHelper
  before_action :logged_in_user, only: %i[new create destroy]

  def index
    @events = Event.all
    @up_events = Event.upcoming
    @prev_events = Event.previous
    @my_events = Attendant.my_events(current_user)
  end

  def show
    @event = Event.find(params[:id])
    @attendees = []
    @event.attendants.each do |user|
      @attendees << User.find(user.user_id)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = Event.new(event_args)
    @event.set_user!(current_user)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy; end

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
