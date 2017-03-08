require 'rails_helper'

RSpec.feature 'Test films table view' do

  before do
    film1 = FactoryGirl.create(:film, title: 'Black Mass', description: 'A good film', genre1_id: '3')
    film2 = FactoryGirl.create(:film, title: 'Alien', description: 'A good film', genre1_id: '1')

    visit '/films'
  end

  scenario 'list action only movies' do
    click_link 'Action'
    expect(page).to have_content 'Films (table)'
    expect(page).to have_content 'Black Mass'
    expect(page).not_to have_content 'Alien'
  end

  scenario 'list horror only movies' do
    click_link 'Horror'
    expect(page).to have_content 'Films (table)'
    expect(page).to have_content 'Alien'
    expect(page).not_to have_content 'Black Mass'
  end

end