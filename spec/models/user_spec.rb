require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  
  it "should have an username" do
    user = Factory.build(:user, :username => '')
    user.should_not be_valid
  end

  it "should have an email" do
    user = Factory.build(:user, :email => '')
    user.should_not be_valid
  end

  it "should have a unique email id" do
    user_1 = Factory.create(:user)
    user_2 = Factory.build(:user,:email=>user_1.email)
    user_2.should_not be_valid
  end

  it "should have a unique username" do
    user_1 = Factory.create(:user)
    user_2 = Factory.build(:user,:username=>user_1.username)
    user_2.should_not be_valid
  end

  it "should have proper email format" do
    invalid_email_formats = ['xx@.com','xx.com','xx','xx@xx']
    invalid_email_formats.each do |email|
      user = Factory.build(:user, :email => email)
      user.should_not be_valid
    end
  end
  
end