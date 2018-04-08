class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: :show

  def index
    @restaurants = Restaurant.published.page(params[:page]).per(20)
  end

  def show
  end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end
end
