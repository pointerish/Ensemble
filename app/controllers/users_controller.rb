class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @my_events = @user.events
    @attending_events = @user.attended_events
  end

  def create
    @user = User.new(user_args)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_args
    params.require(:user).permit(:username)
  end
end
