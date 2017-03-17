require 'rails_helper'

RSpec.feature 'Users can view counties' do

  let!(:country) { FactoryGirl.create(:country, country: 'England') }
  let!(:county) { FactoryGirl.create(:county, county: 'Buckinghamshire', country: country) }

  before do
    visit admin_counties_path
  end

  scenario 'with the film details' do
    expect(page).to have_content 'Buckinghamshire'
    expect(page).to have_content 'England'
  end
end