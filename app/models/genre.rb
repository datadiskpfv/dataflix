class Genre < ActiveRecord::Base

  validates :genre, presence: true

  ## used to retrieve the ame of the Genre (used by associate)
  def to_s
    genre
  end
end