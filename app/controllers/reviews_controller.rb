class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(params.require(:review).permit(:content, :hall_id).merge(user_id: current_user.id)) 
    if @review.save!
      redirect_back(fallback_location: billisearch_halls_path)
    else
      redirect_back(fallback_location: billisearch_halls_path)
    end
  end
end
