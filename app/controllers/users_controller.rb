class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to new_user_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
