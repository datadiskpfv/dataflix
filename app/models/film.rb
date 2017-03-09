class Film < ActiveRecord::Base

  belongs_to :genre1, class_name: 'Genre'
  belongs_to :genre2, class_name: 'Genre'
  belongs_to :rating

  mount_uploader :image1, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :genre1_id, presence: true
  validates :genre2_id, presence: true
  validates :rating_id, presence: true
  #validates :image1, presence: true
  validates :release_year, presence: true
  validates :blu_ray_stock, presence: true

  validates_uniqueness_of :title, :scope => :release_year
end