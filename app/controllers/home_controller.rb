class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.published.last(5)
  end


end
