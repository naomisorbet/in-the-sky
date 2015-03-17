class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :current_user
  
  def current_user
    @current_user || User.find_by_session_token(session[:token])
  end
  
  def logged_in?
    !!current_user
  end
  
  helper_method :logged_in?, :current_user
  
end
