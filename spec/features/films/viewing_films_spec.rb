require 'rails_helper'

RSpec.feature 'Users can view films' do

  scenario 'with the film details' do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/films'
    click_link 'Alien'
    expect(page.current_url).to eq film_url(film)
    within('#genre1') do
      expect(page).to have_content 'Horror'
    end
    within('#genre2') do
      expect(page).to have_content 'Action'
    end
  end
end