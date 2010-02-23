class UserSessionsController < ApplicationController

  def index
    @user_session = UserSession.new
    render :action=>"new"
  end
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      render :text=>"Well You are logged in"
    else
      render :text=>"oh no"
    end
  end
end
