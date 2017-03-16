class County < ActiveRecord::Base

  belongs_to :country
  has_many :addresses

  validates :county, presence: true

  ## used to retrieve the name of the Genre (used by associate)
  def to_s
    county
  end

end