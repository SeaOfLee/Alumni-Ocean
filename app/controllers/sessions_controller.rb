class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.where(email: params[:user][:email]).first
    if u != nil && u.authenticate(params[:user][:password])
      session['user_id'] = u.id.to_s
      redirect_to user_path(u.id)
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
