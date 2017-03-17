require 'rails_helper'

RSpec.feature ' Users can edit countries' do

  let!(:country) { FactoryGirl.create(:country, country: 'United States of America') }

  before do
    visit admin_countries_path
  end

  scenario 'with valid credentials' do
    click_link 'Edit country'

    fill_in 'Country', with: 'England'
    click_button 'Update Country'

    expect(page).to have_content 'Country has been updated.'
    expect(page).to have_content 'England'
  end
end