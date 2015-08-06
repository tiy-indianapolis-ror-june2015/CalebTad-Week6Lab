class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Sets up whitelist for devise attributes across
  # all authentication points
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:username,
               :email,
               :current_password)
    end

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username,
               :email,
               :first_name,
               :last_name,
               :avatar,
               :password,
               :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username,
               :email,
               :username,
               :first_name,
               :last_name,
               :bio,
               :private,
               :avatar,
               :current_password)
    end
  end

end
