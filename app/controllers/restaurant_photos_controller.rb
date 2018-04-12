class RestaurantPhotosController < ApplicationController
  before_action :find_restaurant

  def index
    @restaurant_photos = @restaurant.restaurant_photos
  end

  def new
    @restaurant_photo = RestaurantPhoto.new(restaurant_id: @restaurant.id)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def permitted_params
    params.require(:restaurant).permit(
      :id,
      :name,
      :street_address,
      :city,
      :zip,
      :province,
      :country,
      :price_range,
      :phone,
      :open_hours
    )
  end
end
