module ApplicationHelper
  def link_status
    links = []
    if current_user
      links[0] = link_to 'Create New Event', new_event_path, class: 'btn btn-info'
      links[1] = link_to 'Your Events', user_path(current_user), class: 'btn btn-info'
      links[2] = link_to 'Logout', new_session_path, method: :delete, class: 'btn btn-warning border'
    else
      links[0] = link_to 'Login', new_session_path, class: 'btn text-white border'
      links[1] = link_to 'Sign Up', new_user_path, class: 'btn text-white border'
    end
    links
  end

  def user_attending?(event_id)
    links = []
    if all_events_attended_by_user.find_by(id: event_id)
      links[0] = link_to 'Your Attending This Event', attendances_path(controller: 'attendances', action: 'create', event_id: event_id), method: :post, class: 'btn btn-success disabled '
      links[1] = link_to "Don't Attend", attendance_path(event_id), method: :delete, class: 'btn btn-warning mt-1'
    else
      links[0] = link_to 'Attend', attendances_path(controller: 'invites', action: 'create', event_id: event_id), method: :post, class: 'btn btn-info'
      links[1] = link_to "Don't Attend", attendance_path(event_id), method: :delete, class: 'btn btn-warning disabled mt-1'
    end
    links
  end

  def render_event(event)
    render '/events/event', locals: { title: event.title, desc: event.description, date: (date_format event), event_id: event.id, creator: event.creator.username }
  end
end
