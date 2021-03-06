class SessionsController < ApplicationController

  def new

  end 

  def create


    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "logged in successfully"
      redirect_to user
    
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new' #we are displaying a new form over again, and not redirecting.
    end 
  end 

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end 

  def omniauth
    @user = User.create_by_google_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end 


  private

  def auth
    request.env['omniauth.auth']
  end 

end 