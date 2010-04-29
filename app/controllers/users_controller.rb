class UsersController < ApplicationController
  
  def new
   @user = User.new
  end

  def create
    @user = User.new(params[:user])
   logger.debug "[UsersController][create] ==> " 
    respond_to do |format|
      if @user.save
        flash[:notice] = "Your account was successfully created"
        format.html{ render :template=>"users/signup_success" }
      else 
        format.html{ render :action=> :new }
      end
    end
  end

  def show
    
  end


  def activate_account
    @user = User.find_by_perishable_token(params[:token])
    unless @user.nil?
      @user.activated_at = DateTime.now
      @user.reset_perishable_token
      @user.save
      flash[:notice]= "Your account has been activated"
      redirect_to user_url(@user)
    else
      render :template=>"users/activation_link_failure"
    end  
  end
end
