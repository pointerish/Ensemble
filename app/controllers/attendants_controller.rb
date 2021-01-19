class AttendantsController < ApplicationController
  def new
    @attendant = Attendant.new
  end

  def create
    @attendant = Attendant.new(attendant_args)
    redirect_to root_path if @attendant.save
  end

  private

  def attendant_args
    params.permit(:user_id, :event_id)
  end
end
