class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_back_or root_path
    else
      flash.now[:notice] = "You seem to not exist around here! Sign Up!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
