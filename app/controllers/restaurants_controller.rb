class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.published.page(params[:page]).per(20)
  end
end
