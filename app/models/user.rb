class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         def confirmation_required?
           true
         end
  
  has_many :reviews
  has_many :restaurants
         
  ratyrate_rater  
  
  def has_eatery?
    true if restaurants.count > 0
  end
end
