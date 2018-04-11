class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_restaurant, only: :show
  before_action :owner, only: :edit

  def index
    @restaurants = Restaurant.search(params).page(params[:page]).per(10)
  end

  def show
    @reviews = @restaurant.reviews
  end

  def edit
  end

  def owner
     unless @restaurant.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Eatery'
      redirect_to restaurants_path
     end
    end

  private

  def find_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end
end
