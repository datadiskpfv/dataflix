class Film < ActiveRecord::Base

  belongs_to :genre1, class_name: 'Genre'

  validates :title, presence: true
  validates :description, presence: true
end