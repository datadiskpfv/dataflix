class Postcode < ActiveRecord::Base

  has_many :addresses

  validates :postcode, presence: true

  ## used to retrieve the name of the Genre (used by associate)
  def to_s
    postcode
  end
end
