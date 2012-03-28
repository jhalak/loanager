class UsersController < ApplicationController
  
  before_filter :confirm_logged_in
    
  def index
    list
    render "list"
  end
  
  def list
    @users = User.order :created_at => "desc"
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new()
  end
  
  def create
    # instantiate the object
    @user = User.new(params[:user])
    #save the object
    if @user.save
      #redirect
      flash[:notice] = "New user created"
      redirect_to @user
    else
      #view the form
      render "new"
    end
  end
  
  def edit
    #load the object
    @user = User.find(params[:id])    
  end
  
  def update
    #load the object
    @user = User.find(params[:id])
    #update the object
    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated"
      redirect_to :action => "show", :id => @user.id
    else
      render "edit"
    end    
  end
  
  def delete
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => "index"
  end  
end
