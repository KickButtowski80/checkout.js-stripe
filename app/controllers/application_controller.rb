class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action do   
    Rack::MiniProfiler.authorize_request   if user_signed_in? && admin?           
    end
  
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end
end
