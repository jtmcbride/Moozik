class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login(user)
    if user.activated
      session[:session_token] = user.session_token
    end
  end

  def logged_in?
    current_user ? true : false
  end

  def check_login
    unless logged_in?
      redirect_to new_session_url
    end
  end

end
