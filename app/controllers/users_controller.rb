class UsersController < ApplicationController
  
  def list
    @users = User.order(:created_at => "desc");
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new(:email => 'required')
  end
  
  def create
    # instantiate the object
    @user = User.new(params[:user])
    #save the object
    if @user.save
      #redirect
      redirect_to(:action => "list")
    else
      #view the form
      render ("new")
    end
  end
end
