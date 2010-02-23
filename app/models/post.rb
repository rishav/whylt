class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title,:body, :user
  validates_length_of :body, :within => 1..512
  before_validation :add_title

  def add_title
    if self.title.blank?
      self.title = Time.now.to_s
    end
  end
end
