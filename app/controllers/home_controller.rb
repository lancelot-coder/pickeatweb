class HomeController < ApplicationController
  def index
    published_restaurants = Restaurant.published
    @restaurants = published_restaurants.last(5)
    @random_eateries = published_restaurants.order("RANDOM()").last(8)
  end
end
