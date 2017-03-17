require 'rails_helper'

RSpec.feature ' Users can delete addresses' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)
    postcode1 = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')
    postcode2 = FactoryGirl.create(:postcode, postcode: 'MK10 6DW')

    address1 = FactoryGirl.create(:address, county: county, country: country, postcode: postcode1)
    address2 = FactoryGirl.create(:address, house_name: 'The Cottage', county: county, country: country, postcode: postcode2)
    visit '/admin/addresses'
  end

  scenario 'with valid credentials' do
    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'

    find('#delete_the_barn_mk10_7dw').click

    expect(page).to have_content 'Address has been deleted.'
    expect(page).not_to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
    expect(page).to have_content 'The Cottage 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 6DW'
  end
end