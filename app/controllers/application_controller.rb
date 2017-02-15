class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from "CanCan::AccessDenied" do |exception|
  	redirect_to main_app.root_url, :alert => exception.message
	end

	before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs

  #rescue_from "CanCan::AccessDenied" do |exception|
  #redirect_to main_app.root_url, :alert => exception.message
end
end
