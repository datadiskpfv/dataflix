class Address < ActiveRecord::Base
  belongs_to :postcode
  belongs_to :county
  belongs_to :country

  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :postcode_id, presence: true
  validates :county_id, presence: true
  validates :country_id, presence: true

  def full_address
    return "#{house_name}
            #{house_number}
            #{address1}
            #{address2}
            #{city}
            #{county}
            #{country}
            #{postcode}
           "
  end

end