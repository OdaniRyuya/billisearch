class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_favorites_pagination =  @user.favorites.page(params[:page]).per(PAGINATION_MAX_HALLS_COUNT)
  end
end
