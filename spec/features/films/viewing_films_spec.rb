require 'rails_helper'

RSpec.feature 'Users can view films' do

  scenario 'with the film details' do
    genre1 = FactoryGirl.create(:genre, genre: 'Horror')
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film', genre1: genre1)

    visit '/films'
    click_link 'Alien'
    expect(page.current_url).to eq film_url(film)
    expect(page).to have_content 'Alien'
    expect(page).to have_content 'Horror'
  end
end