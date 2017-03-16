require 'rails_helper'

RSpec.feature 'Users can view countries' do

  before do
    usa = FactoryGirl.create(:country, country: 'United States of America')
    england = FactoryGirl.create(:country, country: 'England')

    visit '/admin/countries'
  end

  scenario 'with the film details' do
    expect(page).to have_content 'England'
    expect(page).to have_content 'United States of America'
  end
end