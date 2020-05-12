class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in?, only: %i[create show new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = current_user.attending_events.upcoming_events
    @previous_events = current_user.attending_events.previous_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "Account created succesfully welcome #{@user.name}"
      log_in @user
      redirect_to root_path
    else
      flash.now[:notice] = 'Please enter your name'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
