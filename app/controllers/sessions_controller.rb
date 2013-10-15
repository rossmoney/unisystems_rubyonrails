class SessionsController < ApplicationController

  before_filter :authenticate_login

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      if :logged_in_as_employee?
        redirect_to root_path, :notice => "Logged in as employee successfully"
      elsif :logged_in_as_office?
        redirect_to root_path, :notice => "Logged in as office successfully"
      end
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to login_path, :notice => "You successfully logged out"
  end
end

