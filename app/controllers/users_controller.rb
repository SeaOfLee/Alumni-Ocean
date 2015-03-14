class UsersController < ApplicationController

  before_filter :authorize, only: [:search, :index, :show, :update, :edit, :destroy]

  def search
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.is_admin = false
    if @user.save
      session['user_id'] = @user.id.to_s
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.where(id: params[:id]).first
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def edit
    @user = User.where(id: params[:id]).first
  end

  def destroy
    @user = User.where(id: params[:id]).first
    @user.destroy
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_location, :program_attended, :campus, :cohort, :bio, :avatar)
  end
end
