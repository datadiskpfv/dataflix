class Genre < ActiveRecord::Base

  has_many :films

  validates :genre, presence: true, uniqueness: true

  ## used to retrieve the name of the Genre (used by associate)
  def to_s
    genre
  end
end