require 'rails_helper'

RSpec.feature ' Users can delete counties' do

  before do
    country = FactoryGirl.create(:country, country: 'England')
    county = FactoryGirl.create(:county, county: 'Buckinghamshire', country: country)

    visit '/admin'
    click_link 'County Area'
  end

  scenario 'with valid credentials' do
    find('#delete_Buckinghamshire').click

    expect(page).to have_content 'County has been deleted.'
    expect(page).not_to have_content 'Buckinghamshire'
  end
end