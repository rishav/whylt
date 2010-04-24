class UsersController < ApplicationController
  
  def new
   @user = User.new
  end

  def create
    @user = params[:user]
    respond_to do |format|
      if @user.save
        flash[:notice] = "Your account was successfully created"
        format.html{ redirect_to user_url(@user) }
      else        
        format.html{ render :action=> :new }
      end
    end
  end
end
