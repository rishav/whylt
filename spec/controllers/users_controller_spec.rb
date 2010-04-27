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

  def activation_information
    {
      :token => "123456789"
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
    @user = mock_model(User)
    #User.stub!(:new).and_return(@user)
    @params = valid_user_attributes
  end

  def do_post
    post :create, :user=>@params
  end

  it "should save the user object" do
    User.should_receive(:new).and_return(@user)
    @user.should_receive(:save).and_return(@user)
    do_post
  end

  it "should redirect the user to the show page" do
    User.should_receive(:new).and_return(@user)
    @user.should_receive(:save).and_return(true)
    do_post
    response.should redirect_to(user_url("#{@user.id}"))
   end

  it "should redirect the user to the show page after a successful account creation with a flash message" do
    User.should_receive(:new).and_return(@user)
    @user.should_receive(:save).and_return("bananahammock")
    do_post    
    flash[:notice].should =~ /your account was successfully created/i
  end

  it "should render the new user signup page /users/new when save fails" do
    User.should_receive(:new).and_return(@user)
    @user.should_receive(:save).and_return(false)
    do_post
    response.should render_template('new')
  end

end

describe UsersController, "handle GET /users/activate_account/:id" do
  include UsersDetailsHelper
 
  before(:each) do
    @user = mock_model(User, :save=>true)
    User.stub!(:find_by_perishable_token).with("123456789").and_return(@user)
    @params = activation_information
  end

  def do_get
    get :activate_account, :token=>"123456789"    
  end

  it "should find the user based on the activation token" do
    @user.should_receive(:find_by_perishable_token).with(:token=>"123456789").and_return(@user)
    do_get
    assigns[:user][:activated_at].should eql(DateTime.now)
  end

  it "should set the activated_at field to the current_time" do 
  end

  it "should display a success message on success of finding a user" do
  end

  it "should render error page on not finding the user based on the perishable token " do
  end
end

