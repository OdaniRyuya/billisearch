class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  PAGINATION_MAX_HALLS_COUNT = 2

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :image, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :image])
    end
end
