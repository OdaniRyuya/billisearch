class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  PAGINATION_MAX_HALLS_COUNT = 2



  def set_search
    @q = Hall.ransack(params[:q])
    @q.sorts = ['name asc', 'id asc'] if @q.sorts.empty?
    @search_halls = @q.result
    @search_halls_count = @search_halls
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :image, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :image])
  end
end
