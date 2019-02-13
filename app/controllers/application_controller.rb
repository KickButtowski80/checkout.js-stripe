class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action do 
      if user_signed_in? &&  current_user.user_type == 'admin user'
        Rack::MiniProfiler.authorize_request
      end
    end
  
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end
end
