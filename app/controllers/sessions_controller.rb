class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:private_events_id_session] = @user.id
        redirect_to user_path(current_user)
      else
        redirect_to new_session_path, alert: "You are not signed up!"
      end
  end

  def destroy
    session.delete(:private_events_id_session)
    redirect_to new_session_path, notice: 'Your Logged out.'
  end
end
