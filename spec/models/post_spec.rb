require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do

  it "should have an body" do
    post = Factory.build(:post, :body=>'')
    post.should_not be_valid
  end

  it "should have a title if not provided with one" do
    post = Post.create(:title=>'',:body=>"test",:user_id=>'1')
    post.title.should_not be_blank
  end

  it "character limit should be not more than 512 characters" do
    post = Factory.build(:post, :body=>'a'*513)
    post.should_not be_valid
  end

  it "should belong to a user"  do
    post = Factory.build(:post, :user=>nil)
    post.should_not be_valid
  end

end
