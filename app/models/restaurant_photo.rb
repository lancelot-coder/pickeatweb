class RestaurantPhoto < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :photo, styles: { thumb: "100x100>", big: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
