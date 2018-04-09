class Contact < ApplicationRecord
  validates_presence_of :message
end
