class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, hall_id: params[:id])
    redirect_back(fallback_location: billisearch_halls_path)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, hall_id: params[:id])
    favorite.destroy
    redirect_back(fallback_location: billisearch_halls_path)
  end
end
