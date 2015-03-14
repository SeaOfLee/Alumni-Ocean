class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user

  #returns nil if user is not logged in
  def current_user
    User.where(id: session["user_id"]).first
  end

  def authorize
    redirect_to '/sessions/new' unless current_user
  end

end
