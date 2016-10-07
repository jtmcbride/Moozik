class UsersController < ApplicationController
  before_action :check_login, only: [:show]
  before_action :check_admin, only: [:index]

  def new
    redirect_to user_url(current_user) if logged_in?
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    redirect_to user_url(current_user) if logged_in?
    @user = User.new(user_params)
    if @user.save
      # login(@user)
      email = UserMailer.activation_email(@user)
      email.deliver
      # redirect_to user_url(@user)
      render :activation
    else
      render :new
    end
  end

  def show
    unless current_user
      redirect_to new_session_url
    end
  end

  def activate
    debugger
    @user = User.where(activation_token: params[:activation_token]).first
    if @user
      @user.activated = true
      @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def admin
    if current_user.admin
      user = User.find(params[:id])
      user.admin = true
      user.save
      redirect_to users_url
    else
      redirect_to users_url(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def check_admin
    unless current_user.admin
      redirect_to root_url
    end
  end

end
