class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
   
  def new
    @user = User.new
  end 

  def show
   
    @daily_logs = @user.daily_logs
  end 

  def index
    @users = User.all
  end 

  def edit 
    
  end 

  def update
   
    if @user.update(user_params)
      flash[:notice] = 'You have updated you information!'
      redirect_to @user
    else
      render 'edit'
    end 
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Our Home #{@user.username}, you have successfully signed up "
      redirect_to daily_logs_path
    else
      render 'new'
    end 
  end 

  def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user #this allows the admin to stay logged in while staff member is deleted 
      flash[:notice] = "We are sorry to our staff go"
      redirect_to root_path
  end 



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end 

  def set_user
    @user = User.find(params[:id])
  end 

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end 
  end 

end 