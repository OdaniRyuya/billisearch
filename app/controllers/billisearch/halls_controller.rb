class Billisearch::HallsController < ApplicationController
  def index
    @halls = Hall.all
  end

  def new
    @hall = Hall.new
  end
end
