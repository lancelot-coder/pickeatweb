class RestaurantPhoto < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :photo, styles: { thumb: "100x100>", big: "500x500>" }, default_url: "//s3.amazonaws.com/pickeat/eateries/default_photos/default-thumbnail.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  scope :not_primary, -> { where(primary: false) }
end
