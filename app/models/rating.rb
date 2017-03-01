class Rating < ActiveRecord::Base

  validates :rating, presence: true
end
