require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module UsersDetailsHelper
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

include UsersDetailsHelper

describe UsersController, "handling GET /users/new"  do

  before(:each)do 
    @user = mock_model(User)
    User.stub!(:new).and_return(@user)
  end

  def do_get
    get :new 
  end

  it "should create new user object" do
    User.should_receive(:new).and_return(@user)
    do_get
  end

  it "should render the new template views/users/new.html.erb" do
    do_get
    response.should render_template("new")
  end
end




describe UsersController, "handle POST /users" do
  before(:each) do
    @user = mock_model(User, :save=>true)
    @params = valid_user_attributes
    @params[:id] = nil
  end

  def do_post
    post :create, :user=>@params
  end

  it "should save the user object" do
    do_post
    @saved_user = User.new
    @saved_user.attributes = valid_user_attributes
    @user.should_receive(:save).and_return(@saved_user)
  end

  it "should redirect the user to the show page" do 
  end
end
