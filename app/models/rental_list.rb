class RentalList < ActiveRecord::Base

  belongs_to :user
  belongs_to :film

  validates_uniqueness_of :film_id, scope: [ :film_format, :user_id ]
end