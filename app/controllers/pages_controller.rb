class PagesController < ApplicationController
  def dashboard
    @posts = Post.limit(3)
    @jobs = Job.limit(3)
    @events = Event.limit(3)
  end
end
