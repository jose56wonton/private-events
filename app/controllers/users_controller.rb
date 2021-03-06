class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success] = "User created successfully!"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/name!"
    end

  end
  def show
    @user = User.find(session[:user_id])
    @user.events
  end

  private
    def user_params
      params.require(:user).permit(:name,:email)
    end

end
