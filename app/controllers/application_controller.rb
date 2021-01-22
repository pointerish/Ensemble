# rubocop:disable Style/GuardClause

class ApplicationController < ActionController::Base
  include SessionsHelper

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end

# rubocop:enable Style/GuardClause
