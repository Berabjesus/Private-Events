module EventsHelper
  def user_attending? event_id
    links = []
    if events_user_attending.find_by(id: event_id)
     links[0] = link_to "Attending", invites_path(:controller => "invites", :action => "create", :event_id=> locals[:event_id]), method: :post, class: 'btn btn-info disabled'
     links[1] = link_to "Remove", invites_path(:controller => "invites", :action => "create", :event_id=> locals[:event_id]), method: :post, class: 'btn disabled'
    else
      link_to "Attend", invites_path(:controller => "invites", :action => "create", :event_id=> locals[:event_id]), method: :post
    end
  end
end
