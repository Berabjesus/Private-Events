class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    User.find_by(id: session[:private_events_id_session]) unless session[:private_events_id_session].nil?
  end

  # def logged_in?
  #   session[:private_events_id_session].present?
  # end
end
