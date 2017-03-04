class Film < ActiveRecord::Base

  belongs_to :genre1, class_name: 'Genre'
  belongs_to :genre2, class_name: 'Genre'
  belongs_to :rating

  validates :title, presence: true
  validates :description, presence: true
end