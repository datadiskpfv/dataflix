require 'rails_helper'

RSpec.feature ' Users can edit countries' do

  before do
    usa = FactoryGirl.create(:country, country: 'United States of America')

    visit '/admin/countries'
  end

  scenario 'with valid credentials' do
    click_link 'Edit country'

    fill_in 'Country', with: 'England'
    click_button 'Update Country'

    expect(page).to have_content 'Country has been updated.'
    expect(page).to have_content 'England'
  end
end