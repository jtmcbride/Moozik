class UsersController < ApplicationController
  before_action :check_login, only: [:show]

  def new
    redirect_to user_url(current_user) if logged_in?
  end

  def create
    redirect_to user_url(current_user) if logged_in?
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def show
    unless current_user
      redirect_to new_session_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
