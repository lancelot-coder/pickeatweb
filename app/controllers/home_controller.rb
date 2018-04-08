class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.published.last(3)
  end
end
