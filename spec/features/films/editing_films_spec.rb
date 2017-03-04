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
    click_button 'Update Film'

    expect(page).to have_content 'Film has been updated.'
    expect(page).to have_content 'A very good film'
    within('#genre1') do
      expect(page).to have_content 'Horror'
    end
    within('#genre2') do
      expect(page).to have_content 'Action'
    end
    within('#rating') do
      expect(page).to have_content '18'
    end
  end
end