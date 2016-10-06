class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_url(current_user)
    end
  end

  def create
    redirect_to user_url(user) if logged_in?
    user = User.find_by_creds(session_params[:email], session_params[:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:login] = "Username and password incorrect."
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
