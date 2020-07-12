class UsersController < ApplicationController
   
  def new
    @user = User.new
  end 

  def edit 
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

  end 

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Our Home #{@user.username}, you have successfully signed up "
      redirect_to daily_logs_path
    else
      render 'new'
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end 

end 