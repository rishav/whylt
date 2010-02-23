require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  def mock_session(stubs={})
    @mock_session ||= mock_model(UserSession, stubs)
  end
  #Delete this example and add some real ones
  describe "Get new" do
    it "assigns a new user session as @user_session" do
      UserSession.stub!(:new).and_return(mock_session)
      get :new
      assigns[:user_session].should equal(mock_session)
    end
  end

  context "Get /login " do
    it "should point to /sessions/new path" do
      params_from(:get, "/login").should == {:controller => "user_sessions", :action => "new"}
    end
  end

  context "Get /logout " do
    it "should point to /sessions/new path" do
      params_from(:delete, "/logout").should == {:controller => "user_sessions", :action => "destroy"}
    end
  end

  context "Get index" do
    it "should go render action new when index is called" do
      UserSession.stub!(:new).and_return(mock_session)
      get :index
      assigns[:user_session].should equal(mock_session)
      response.should render_template("user_sessions/new.erb")
    end
  end

  context "POST create" do


    it "logs the user in when proper credentials are enter" do
      UserSession.stub!(:new).and_return(mock_session(:save => true))
      UserSession.should_receive(:new).with({"username"=>'test',"password"=>"password"})
      post :create, :user_session=>{:username=>'test',:password=>"password"}
      assigns[:user_session].should == mock_session
    end

    it "redirects to back or home" do
      
    end

    it "with invalid params" do
      UserSession.stub!(:new).and_return(mock_session(:save => false))
      UserSession.should_receive(:new).with({"username"=>'test',"password"=>"password123"})
      post :create, :user_session=>{:username=>'test',:password=>"password123"}
      assigns[:user_session].should == mock_session
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested session"

    it "redirects to root"
  end
end