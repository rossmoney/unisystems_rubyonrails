class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  # Returns the currently logged in user or nil if there isn't one
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Make current_user available in templates as a helper
  helper_method :current_user

  # Filter method to enforce an admin login requirement
  # Apply as a before_filter on any controller you want to protect
  def authenticate_office
    logged_in_as_office? ? true : access_denied
  end

  # Filter method to enforce a sales login requirement
  # Apply as a before_filter on any controller you want to protect
  def authenticate_employee
    logged_in_as_employee? ? true : access_denied
  end

  def authenticate_login
    if params[:action] != "new" && params[:action] != "create"
      logged_in? ? true : access_denied
    end
  end

  # Predicate method to test for a logged in admin user
  def logged_in_as_office?
    (current_user.is_a? User) && (current_user.user_type == "Office Staff")
  end

  # Predicate method to test for a logged in employee
  def logged_in_as_employee?
    (current_user.is_a? User) && (current_user.user_type == "Employee")
  end

  def logged_in?
    (current_user.is_a? User)
  end

  # Make logged_in? methods available in templates as a helper
  helper_method :logged_in_as_office?
  helper_method :logged_in_as_employee?

  def access_denied
    redirect_to login_path, :notice => "Access denied - either you are not logged in or you don't have the required access level, please log in to continue"
  end


end
