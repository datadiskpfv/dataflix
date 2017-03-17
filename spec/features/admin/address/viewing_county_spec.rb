require 'rails_helper'

RSpec.feature 'Users can view counties' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)

    visit '/admin/counties'
  end

  scenario 'with the film details' do
    expect(page).to have_content 'Buckinghamshire'
    expect(page).to have_content 'England'
  end
end