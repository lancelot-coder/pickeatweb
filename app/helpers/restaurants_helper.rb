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

  def user_rated?(user, restaurant)
    rate = Rate.find_by(rater: user, rateable: restaurant)
    true if rate.present?
  end

  def rating_per_user(restaurant, user)
    rate = Rate.where(rateable: restaurant, rater_id: user.id).first
    rate.present? ? rate.stars : 0
  end
end
