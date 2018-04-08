class Category < ApplicationRecord
  has_many :restaurants

  validates_presence_of :title
  validates_uniqueness_of :title
end
