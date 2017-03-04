class Genre < ActiveRecord::Base

  has_many :films

  validates :genre, presence: true

  ## used to retrieve the ame of the Genre (used by associate)
  def to_s
    genre
  end
end