class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in?, only: [:create, :show, :new]
  
    def new
      @user = User.new
    end
  
    def show
      @user = User.find(params[:id]) 
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user
      else
        render :new
      end
    end
    
    private
  
    def user_params
      params.require(:user).permit(:name)
    end

end
