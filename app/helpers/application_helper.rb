module ApplicationHelper
  def link_status
    links = []
    if current_user
      links[0] = link_to "Create New Event", new_event_path, class: 'btn btn-info'
      links[1] = link_to "Your Events", user_path(current_user), class: 'btn btn-info'
      links[2] = link_to 'Logout', new_session_path, method: :delete, class: 'btn btn-warning border'
    else
      links[0] = link_to 'Login', new_session_path, class: 'btn text-white border'
      links[1] = link_to 'Sign Up', new_user_path, class: 'btn text-white border'
    end
    links
  end

  def user_attending? event_id
    links = []
    if all_events_attended_by_user.find_by(id: event_id)
      links[0] = link_to "Your Attending This Event", invites_path(:controller => "invites", :action => "create", :event_id=> event_id), method: :post, class: 'btn btn-success disabled '
      links[1] = link_to "Don't Attend", invite_path(event_id), method: :delete, class: 'btn btn-warning mt-1'
    else
      links[0] = link_to "Attend", invites_path(:controller => "invites", :action => "create", :event_id=> event_id), method: :post, class: 'btn btn-info'
      links[1] = link_to "Don't Attend", invite_path(event_id), method: :delete, class: 'btn btn-warning disabled mt-1'
    end
    links
  end

  def date_format(event)
    event.date.to_formatted_s(:long) unless event.date.nil?
  end
end
