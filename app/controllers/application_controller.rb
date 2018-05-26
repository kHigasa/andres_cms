class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login username email password remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password password_confirmation current_password])
  end

  def after_sign_in_path_for(_user)
    root_path
  end

  def after_sign_out_path_for(_user)
    root_path
  end
end
