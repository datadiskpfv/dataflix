require 'rails_helper'

RSpec.feature ' Users can edit films' do

  scenario 'with valid credentials' do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/films'
    click_link 'Alien'
    click_link 'Edit Film'

    fill_in 'Description', with: 'A very good film'
    select 'Horror', from: 'Genre1'
    select 'Action', from: 'Genre2'
    select '18', from: 'Rating'
    fill_in 'Release Year', with: '1979'
    click_button 'Update Film'

    expect(page).to have_content 'Film has been updated.'
    expect(page).to have_content 'A very good film'
    expect(page).to have_content '1979'
    within('#genre') do
      expect(page).to have_content 'Horror / Action'
    end
    within('#rating') do
      expect(page).to have_css("img[src*='18']")
    end
  end
end