class Address < ActiveRecord::Base
  belongs_to :postcode
  belongs_to :county
  belongs_to :country

  validates_presence_of :house_number, :unless => :house_name?, message: "You must have either house name or house number"
  validates_presence_of :house_name, :unless => :house_number?, message: "You must have either house name or house number"

  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :postcode_id, presence: true
  validates :county_id, presence: true
  validates :country_id, presence: true

  validates_uniqueness_of :postcode_id, scope: [:house_number, :house_name, :address1, :address2],
                          message: "Address already taken"

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