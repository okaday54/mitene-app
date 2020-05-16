class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_host
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  protected

    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs

      # devise_parameter_sanitizer.permit(:invite) << :username
      # devise_parameter_sanitizer.permit(:accept_invitation) << :username
      devise_parameter_sanitizer.permit(:invite, keys: [:email, :username])

      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :password_confirmation])


    end

    def set_host
      Rails.application.routes.default_url_options[:host] = request.host_with_port
    end
  
end
