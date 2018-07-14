class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb I18n.t('misc.home'), :root_path
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Error handling
  unless Rails.env.development?
    rescue_from Exception,                        with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
    rescue_from OpenURI::HTTPError,               with: :_render_503
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def _render_404(error = nil)
    logger.info "Rendering 404 with exception: #{error.message}" if error

    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render 'errors/404', status: :not_found
    end
  end

  def _render_500(error = nil)
    logger.error "Rendering 500 with exception: #{error.message}" if error

    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render 'errors/500', status: :internal_server_error
    end
  end

  def _render_503(error = nil)
    logger.error "Rendering 503 with exception: #{error.message}" if error

    if request.format.to_sym == :json
      render json: { error: '503 error' }, status: :service_unavailable
    else
      render 'errors/503', status: :service_unavailable
    end
  end

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
