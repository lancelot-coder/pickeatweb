class HomeController < ApplicationController
  def index
    published_restaurants = Restaurant.published
    @restaurants = published_restaurants.last(8)
    @numberofrestaurants = published_restaurants.last(2)
    @random_eateries = published_restaurants.order("RANDOM()").last(8)
  end
end
