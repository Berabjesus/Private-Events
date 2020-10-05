class UsersController < ApplicationController
  before_action :authorized, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? && @user.save
      redirect_to new_session_path, notice: 'Sign up successful, login using your credentials'
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
