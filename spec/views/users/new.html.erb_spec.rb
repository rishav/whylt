require File.dirname(__FILE__) + '/../../spec_helper'

describe "/users/new.html.erb" do 
  include UsersHelper

  before(:each) do
    @user =  mock_model(User)
    @user.should_receive(:email).and_return("Email")
    @user.should_receive(:password).and_return("password")
    @user.should_receive(:password_confirmation).and_return("password_confirmation")
    assigns[:user] = @user
  end

  it "should render registration form" do
    render "/users/new.html.erb"
    puts response.body

    response.should have_tag("form[action=?][method=post]", users_path) do 
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_password[name=?]", "user[password]")
      with_tag("input#user_password_confirmation[name=?]", "user[password_confirmation]")
    end
  end
end
