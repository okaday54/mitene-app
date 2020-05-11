class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, ])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, ])

      devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :username) }
      devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :username) }

    end
  
end
