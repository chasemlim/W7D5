class ApplicationController < ActionController::Base

  helper_methods :current_user, :logged_in?

  def login!(user)
    session[:session_token] = User.reset_session_token!
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

end
