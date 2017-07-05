class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user
      flash[:success] = "Welcome back #{user.name}"
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email"
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    flash[:success] = "Sucessfully logged out"
    redirect_to root_url
  end
end
