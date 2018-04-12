class Restaurant < ApplicationRecord
  ratyrate_rateable 'service'

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  belongs_to :user
  has_many :restaurant_photos
  has_many :reviews

  scope :published, -> { where(published: true) }

  geocoded_by :address do |obj,results|
    obj.send :ensure_geocoding, results.first
  end

  validates :street_address, :province, :city, :zip, :country, presence: true
  after_validation :assign_address
  after_validation :geocode, if: ->  (obj) { obj.address.present? and obj.address_changed? }

  def ensure_geocoding(geo)
    if geo
      self.latitude = geo.latitude
      self.longitude = geo.longitude
      self.address = geo.formatted_address
    else
      errors.add(:address, '^Please provide a valid address')
    end
  end

  def coordinates_blank?
    (latitude.blank? || longitude.blank? || !Rails.env.test?)
  end

  def assign_address
    self.address = [street_address, city, province, country, zip].compact.join(', ')
  end

  def primary_photo_url
    restaurant_photos.where(primary: true).first.photo.url
  end

  def self.search(params)
    restaurants = Restaurant.published
    restaurants = restaurants.where("LOWER(address) LIKE (?)", "%#{params[:keyword].downcase}%") if params[:keyword].present?
    restaurants = restaurants.joins(:category).where("LOWER(categories.title) = ?", 'params[:category].downcase') if params[:category].present? && !params[:category].eql?('category')
    restaurants
  end
end
