require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module UserSpecHelper
  def valid_user_attributes
    { 
        :id => "1",
        :username => "sid",                                                                                                    
        :email => "sid.ravichandran@gmail.com",
        :password => "maryhadalittlelamb",
        :password_confirmation => "maryhadalittlelamb"                                                                         
    }

  end
end


describe UserObserver do
  include UserSpecHelper

  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes
    @params = valid_user_attributes
  end

  def do_save
    post :create, :user=>@params
  end

  it "should send an invitation email to the registered user on save with the persistence token" do
    @user.should_receive(:deliver_registration_mail).and_return(true)
    do_save
  end
end
