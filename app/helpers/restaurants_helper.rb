module RestaurantsHelper
  def category_options
    Category.published.map(&:title).push("category").reverse
  end

  def static_map_for(location, options = {})
    params = {
      :q => location.address,
      :key => ENV["GOOGLE_API_KEY"]
      }.merge(options)
    query_string = params.map{|k,v| "#{k}=#{v}"}.join("&")
    return "https://www.google.com/maps/embed/v1/place?#{query_string}"
  end
end
