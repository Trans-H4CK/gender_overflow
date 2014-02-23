class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit( :email,
                :password,
                :password_confirmation,
                :first_name,
                :last_name,
                :login)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit( :email,
                :password,
                :password_confirmation,
                :first_name,
                :last_name,
                :login,
                :current_password
              )
    end
    devise_parameter_sanitizer.for(:user) do |u|
      u.permit( :email,
                :password,
                :password_confirmation,
                :first_name,
                :last_name,
                :login
              )
    end
  end
end