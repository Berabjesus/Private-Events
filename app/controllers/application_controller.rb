class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:private_events_id_session]) unless session[:private_events_id_session].nil?
  end
end
