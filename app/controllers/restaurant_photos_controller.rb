class RestaurantPhotosController < ApplicationController
  before_action :find_restaurant
  before_action :find_restaurant_photo, only: %w(edit destroy update)

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

  def edit 
  end

  def update
    @restaurant_photo.update_attributes(permitted_params)
    if @restaurant_photo.valid?
      flash.now[:success] = "Photo successfully updated"
      render action: :edit
    else
      flash.now[:error] = @restaurant_photo.errors.full_messages.join(', ')
      render action: :edit
    end
  end

  def destroy
    @restaurant_photo.destroy
    redirect_to restaurant_restaurant_photos_path(@restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def find_restaurant_photo
    @restaurant_photo = RestaurantPhoto.find(params[:id])
  end

  def permitted_params
    params.require(:restaurant_photo).permit(
      :id,
      :photo, 
      :primary
    )
  end
end
