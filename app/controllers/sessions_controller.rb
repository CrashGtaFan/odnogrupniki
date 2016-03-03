class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome to rails simple auth "
      redirect_to root_url
    else
      flash.now[:danger] = "Email or password is invalid"
      render 'new'
    end 
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Good bye"
    redirect_to root_url
  end
end
