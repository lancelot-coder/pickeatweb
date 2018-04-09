module ApplicationHelper
  def lat_lng
    @lat_lng = cookies[:lat_lng].split("|") if cookies[:lat_lng]
  end
end
