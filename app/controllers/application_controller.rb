class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action do
      if current_user && admin?
        Rack::MiniProfiler.authorize_request
      end
    end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end
end
