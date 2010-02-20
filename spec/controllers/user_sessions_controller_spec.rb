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
  
  describe "POST create" do
    it "logs the user in when proper credentials are enter" do
      
    end

    it "redirects to back or home" do

    end

  end

  describe "DELETE destroy" do
    it "destroys the requested session" do
#      Calendar.should_receive(:find).with("37").and_return(mock_calendar)
#      mock_calendar.should_receive(:destroy)
#      delete :destroy, :id => "37"
    end

    it "redirects to root" do
#      Calendar.stub!(:find).and_return(mock_calendar(:destroy => true))
#      delete :destroy, :id => "1"
#      response.should redirect_to(calendars_url)
    end
  end
end
