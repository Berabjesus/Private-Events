class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:private_events_id_session] = @user.id
        redirect_to user_path
      else
        redirect_to sessions_new_path, alert: "You are not signed up!"
      end
  end

  def destroy
  end
end
