class AccessController < ApplicationController
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout] 
  
  def index
    dashboard
    render "dashboard"
  end
  
  def dashboard
    
  end

  def login
    
  end
  
  def attempt_login
    authenticated_user = User.authenticate(params[:username], params[:password])
    if authenticated_user
      # save the value to the session
      session[:id] = authenticated_user.id 
      session[:username] = authenticated_user.username 
      flash[:notice] = "Login successfull"
      redirect_to(:action => "dashboard")
    else
      flash[:notice] = "Username or password is wrong"
      redirect_to(:action => "login")
    end
  end
  
  def logout
    session[:id] = nil 
    session[:username] = nil 
    flash[:notice] = "You are logged out"
    redirect_to(:action => "login")
  end
  
  
  
end
