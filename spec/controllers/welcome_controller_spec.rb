require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WelcomeController do

  #Delete this example and add some real ones
  it "should use WelcomeController" do
    controller.should be_an_instance_of(WelcomeController)
  end

  context "GET index" do
   it "should get index" do
     get :index
     assigns[:title].should eql("Home")
   end
  end

end
