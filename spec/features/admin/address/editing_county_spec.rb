require 'rails_helper'

RSpec.feature ' Users can edit countries' do

  let!(:country) { FactoryGirl.create(:country, country: 'England') }
  let!(:county) { FactoryGirl.create(:county, county: 'Buckinghamshire', country: country) }

  before do
    visit admin_counties_path
  end

  scenario 'with valid credentials' do
    click_link 'Edit county'

    fill_in 'County', with: 'Hertfordshire'
    click_button 'Update County'

    expect(page).to have_content 'County has been updated.'
    expect(page).to have_content 'Hertfordshire'
    expect(page).to have_content 'England'
  end
end