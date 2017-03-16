class Country < ActiveRecord::Base

  has_many :counties
  has_many :addresses

  validates :country, presence: true, uniqueness: true

  ## used to retrieve the name of the Genre (used by associate)
  def to_s
    country
  end

end