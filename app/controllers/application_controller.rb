class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remenber_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
