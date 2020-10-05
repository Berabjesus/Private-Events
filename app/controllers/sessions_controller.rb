class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
  #     session.delete(:guest_session) if !session[:guest_session].nil?
  #     session[:bloggy_user_id_session] = @user.id
  #     redirect_to blogs_path
  #   else
  #     redirect_to sessions_new_path, alert: "You are not signed up!"
      end
  end

  def destroy
  end
end
