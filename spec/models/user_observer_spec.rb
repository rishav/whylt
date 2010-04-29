require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module UserSpecHelper
  def valid_user_attributes
    { 
        :id => "1",
        :username => "sid",
        :email => "sid.ravichandran@gmail.com",
        :password => "maryhadalittlelamb",
        :password_confirmation => "maryhadalittlelamb",
    }

  end
end


describe UserObserver, "after_save" do
  include UserSpecHelper

  before(:each) do
    @user = mock_model(User, valid_user_attributes)
    @params = valid_user_attributes
    UserMailer.stub!(:deliver_registration_mail).with(@user).and_return(true)
    @user_observer = UserObserver.instance
  end

  it "should send an invitation email to the registered user on save with the persistence token" do
    UserMailer.should_receive(:deliver_registration_mail).with(@user).and_return(true)
    @user_observer.after_save(@user)
  end
end
