# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :all_events_attended_by_user, :all_events_created_by_user, :date_format
  def current_user
    User.find_by(id: session[:private_events_id_session]) unless session[:private_events_id_session].nil?
  end

  def logged_in?
    session[:private_events_id_session].present?
  end

  def authorized
    redirect_to new_session_path, alert: 'You are not logged in' unless logged_in?
  end

  def date_format(event, new_date = nil)
    if event.nil?
      new_date.to_formatted_s(:long) if !new_date == nil?
    else
      event.date&.to_formatted_s(:long)
    end
  end

  def all_events_attended_by_user
    current_user.attended_events
  end

  def all_events_created_by_user
    current_user.events
  end
end
