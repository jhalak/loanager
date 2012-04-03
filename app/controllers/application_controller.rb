class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  protected  
  def confirm_logged_in
    unless session[:id]
      flash[:notice] = "You have to login to view this page"
      redirect_to(:controller => "access", :action => "login")
      return false
    else
      return true
    end
  end
  
  
  def current_user
    if logged_in?
      @current_user ||= User.find(session[:id]) rescue nil
    end
    @current_user
  end
  
  
  def logged_in?
    session[:id].present?
  end
  
  
end
