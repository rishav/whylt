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


describe User do 

  include UserSpecHelper

  before(:each) do 
    @user = User.new
  end

  it "should have email id" do
   @user.attributes = valid_user_attributes.except(:email)
   @user.should have(2).errors_on(:email) # presence constraint
  end

  it "should have a unique email_id" do   
    @user.attributes = valid_user_attributes
    @user.save
    @user_2 = User.new
    @user_2.attributes = valid_user_attributes.except([:username, :id])
    @user_2.username = "sid2"
    @user_2.id  = 2
    @user_2.should have(1).error_on(:email) # uniqueness constraint
  end  

  it "should be valid" do
   @user.attributes = valid_user_attributes
   @user.should be_valid 
  end
end
