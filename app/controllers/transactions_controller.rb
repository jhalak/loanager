class TransactionsController < ApplicationController
  before_filter :confirm_logged_in
  
  # GET /transactions
  def index
    query = params[:show_paid].present? ? {:user_id => current_user.id, :is_paid => 1} : {:user_id => current_user.id, :is_paid => 0}  
    @transactions = Transaction.where(query).page params[:page]
  end

  # GET /transactions/1
  def show
    @transaction = Transaction.find(params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(params[:transaction])
    @transaction.title = @transaction.from_name + " >> " + @transaction.to_name;
    if @transaction.save
      redirect_to(@transaction, :notice => 'Transaction was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /transactions/1
  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to(@transaction, :notice => 'Transaction was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to(transactions_url)
  end
  
  def summary
    #raise current_user.person.inspect
    @user_gave = Transaction.where(:from => current_user.person).page params[:page]
    @user_took = Transaction.where(:to => current_user.person).page params[:page]
  end
end
