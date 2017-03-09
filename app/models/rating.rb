class Rating < ActiveRecord::Base

  has_many :films

  validates :rating, presence: true, uniqueness: true

  ## used to retrieve the name of the Rating (used by associate)
  def to_s
    rating
  end
end
