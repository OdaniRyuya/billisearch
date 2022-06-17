class Billisearch::HallsController < ApplicationController

  def index
      @search_halls = @search_halls.page(params[:page]).per(PAGINATION_MAX_HALLS_COUNT) 
  end

  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(params.require(:hall).permit(:image ,:name, :url, :address, :tel, :time, :email, :price, :parking, :billiards, :open, :pr, :lead,))
    if @hall.save
      redirect_to billisearch_home_path
    else
      redirect_to billisearch_home_path
    end
  end

  def show
    @hall = Hall.find(params[:id])
    @review = Review.new
    @reviews = @hall.reviews
  end


  def destroy
    @hall = Hall.find(params[:id])

    @hall.destroy


    redirect_to billisearch_home_path
  end

end
