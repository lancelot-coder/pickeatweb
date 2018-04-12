class RestaurantPhotosController < ApplicationController
  before_action :find_restaurant

  def index
    @restaurant_photos = @restaurant.restaurant_photos.order('created_at DESC')
  end

  def new
    @restaurant_photo = RestaurantPhoto.new
  end

  def create
    @restaurant_photo = RestaurantPhoto.new(permitted_params)
    @restaurant_photo.restaurant = @restaurant
    if @restaurant_photo.save
      flash[:success] = "Photo successfully created"
      redirect_to restaurant_restaurant_photos_path(@restaurant)
    else
      flash.now[:error] = @restaurant_photo.errors.full_messages.join(', ')
      render action: :new
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def permitted_params
    params.require(:restaurant_photo).permit(
      :id,
      :photo, 
      :primary
    )
  end
end
