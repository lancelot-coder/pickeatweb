module RestaurantsHelper
  def category_options
    Category.published.map(&:title).push("category").reverse
  end
end
