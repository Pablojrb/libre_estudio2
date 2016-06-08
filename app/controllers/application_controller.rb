class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configured_permiteed_parameters, if: :devise_controller?

  protected

  def configured_permiteed_parameters
      devise_parameter_sanitizer.for(:sing_up) {|u| u.permit(:email, :password, :password_confirmation, :name, :last_name)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :facebook, :instagram, :name, :last_name)}
  end
end
