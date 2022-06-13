class Billisearch::HallsController < ApplicationController
  def index
    if params[:updated_ASC]
      @halls = Hall.updated_asc
    elsif params[:updated_DESC]
      @halls = Hall.updated_desc
    elsif params[:favorites_DESC]
      @halls = Hall.favorites_desc
    else
      @halls = Hall.all

    end
  end

  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(params.require(:hall).permit(:image ,:name, :url, :address, :tel, :time, :email, :price, :parking, :billiards, :open, :pr, :lead,))
    if @hall.save
      redirect_to billisearch_halls_path
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
    redirect_to billisearch_halls_path
  end


end
