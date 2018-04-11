class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: :show

  def index
    @restaurants = Restaurant.search(params).page(params[:page]).per(10)
  end

  def show
    @reviews = @restaurant.reviews
  end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end
end
