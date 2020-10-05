module ApplicationHelper
  def user_status
    links = []
    if current_user
      links[0] = link_to current_user.username, class: 'btn btn-info'
      links[1] = link_to 'Logout', session_path, method: :delete, class: 'btn btn-warning border'
    else
      links[0] = link_to 'Login', new_session_path, class: 'btn text-white border'
      links[1] = link_to 'Sign Up', new_user_path, class: 'btn text-white border'
    end
    links
  end
end
