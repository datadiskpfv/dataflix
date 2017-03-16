class Address < ActiveRecord::Base
  belongs_to :postcode
  belongs_to :county
  belongs_to :country

  validates :address1, presence: true
  validates :address2, presence: true
  validates :town, presence: true
  validates :city, presence: true
  validates :postcode_id, presence: true
  validates :county_id, presence: true
  validates :country_id, presence: true

end
