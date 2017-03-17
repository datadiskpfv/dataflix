require 'rails_helper'

RSpec.feature 'Users can create new address' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)
    postcode = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')

    visit '/admin'
    click_link 'Create Address'
  end

  scenario 'with validate credentials' do
    fill_in 'House Name', with: 'The Barn'
    fill_in 'House Number', with: '7'
    fill_in 'Address1', with: 'Nairn Grove'
    fill_in 'Address2', with: 'Broughton Gate'
    fill_in 'City', with: 'Milton Keynes'
    select 'Buckinghamshire', from: 'County'
    select 'England', from: 'Country'
    select 'MK10 7DW', from: 'Postcode'

    click_button 'Create Address'

    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Address'

    expect(page).to have_content 'Address has not been created.'
  end
end