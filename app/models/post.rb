class Post < ActiveRecord::Base
  searchkick word_middle: [:title, :content]
  belongs_to :user
  has_many :comments

  validates_presence_of :title
  validates_presence_of :content
end
