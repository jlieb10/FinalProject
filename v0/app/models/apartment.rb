class Apartment < ActiveRecord::Base
  belongs_to :hunt
  has_many :details
end
