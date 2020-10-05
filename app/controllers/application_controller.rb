class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    User.find_by(id: session[:private_events_id_session]) unless session[:private_events_id_session].nil?
  end

  def logged_in?
    session[:private_events_id_session].present?
  end

  def authorized
    redirect_to new_session_path, alert: 'You are not logged in' unless logged_in?
  end
end
