class RestaurantPhoto < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :photo, styles: { thumb: "100x100>", big: "1920x1080>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  scope :not_primary, -> { where(primary: false) }
end
