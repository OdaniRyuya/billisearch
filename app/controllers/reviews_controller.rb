class ReviewsController < ApplicationController
  def new
  
  end

  def create
  
    @review = Review.new(params.require(:review).permit(:content, :hall_id).merge(user_id: current_user.id)) 
    
    if @review.save
      @hall = Hall.find(params[:review][:hall_id])
      @reviews = @hall.reviews
      redirect_to billisearch_hall_path(params[:review][:hall_id])

      
    else

      @hall = Hall.find(params[:review][:hall_id])
      @reviews = @hall.reviews
      render "billisearch/halls/show"
    end
  end
end
