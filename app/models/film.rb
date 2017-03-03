class Film < ActiveRecord::Base

  has_many :genre

  validates :title, presence: true
  validates :description, presence: true
end