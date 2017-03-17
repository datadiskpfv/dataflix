require 'rails_helper'

RSpec.feature 'Users can view addresses' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)
    postcode = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')
    address = FactoryGirl.create(:address, county: county, country: country, postcode: postcode)

    visit '/admin/addresses'
  end

  scenario 'with the film details' do
    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
  end
end