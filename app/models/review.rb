class Review < ApplicationRecord
  validates :user_id, uniqueness: { scope: [:restaurant_id]}
  validates_presence_of :comment_title
  validates_presence_of :comment
  belongs_to :user
  belongs_to :restaurant
end
