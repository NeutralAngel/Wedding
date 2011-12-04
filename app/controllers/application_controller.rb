class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :rsvp_id

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def rsvp_id
    user = current_user
    user.rsvp_id
  end
end
