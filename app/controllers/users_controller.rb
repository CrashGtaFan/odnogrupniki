class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.first_name} thank you for signing up!"
      redirect_to root_url
    else
      render 'new' 
    end 
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
