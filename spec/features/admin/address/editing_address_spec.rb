require 'rails_helper'

RSpec.feature ' Users can edit addresses' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)
    postcode = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')
    address = FactoryGirl.create(:address, county: county, country: country, postcode: postcode)

    visit '/admin/addresses'
  end

  scenario 'with valid credentials' do
    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'

    find('#edit_the_barn_mk10_7dw').click

    fill_in 'House Name', with: 'The Cottage'
    click_button 'Update Address'

    expect(page).to have_content 'Address has been updated.'
    expect(page).to have_content 'The Cottage 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
  end
end