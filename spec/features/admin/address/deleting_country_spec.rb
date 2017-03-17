require 'rails_helper'

RSpec.feature ' Users can delete countries' do

  before do
    usa = FactoryGirl.create(:country, country: 'United States of America')
    england = FactoryGirl.create(:country, country: 'England')

    visit '/admin'
    click_link 'Country Area'
  end

  scenario 'with valid credentials' do
    find('#delete_england').click

    expect(page).to have_content 'Country has been deleted.'
    expect(page).not_to have_content 'England'
    expect(page).to have_content 'United States of America'
  end
end