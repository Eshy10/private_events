class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
