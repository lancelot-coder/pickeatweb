class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category
  
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
end
