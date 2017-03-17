class Postcode < ActiveRecord::Base

  has_many :addresses

  validates :postcode, presence: true

  before_save :uppercase_postcode

  ## make sure we save the postcode in uppercase
  def uppercase_postcode
    postcode.upcase!
  end

  ## used to retrieve the name of the Genre (used by associate)
  def to_s
    postcode
  end
end
