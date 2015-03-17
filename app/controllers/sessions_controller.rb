class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if user.nil?
      render :new
      return
    else
      login_user!(user)
      redirect_to subscriptions_url
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end
  
  private
  
  def login_user!(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end
  
end
