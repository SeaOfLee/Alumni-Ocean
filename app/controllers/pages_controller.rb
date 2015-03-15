class PagesController < ApplicationController

  before_filter :authorize, only: [:dashboard]

  def dashboard
    @posts = Post.limit(3)
    @jobs = Job.limit(3)
    @activities = Activity.limit(3)
  end
end
