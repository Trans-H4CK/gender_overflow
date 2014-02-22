class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to root_url, :alert => "Sorry, you are not allowed to access that page."
    else
      redirect_to login_url, :alert => "Sorry, you must log in to access that page."
    end
  end


end
