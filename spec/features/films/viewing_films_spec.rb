require 'rails_helper'

RSpec.feature 'Users can view films' do

  scenario 'with the film details' do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/films'
    click_link 'Alien'
    expect(page.current_url).to eq film_url(film)
    expect(page).to have_content 'Alien'
    expect(page).to have_content 'A good film'
    expect(page).to have_content '1979'

    within('#genre') { expect(page).to have_content 'Horror / Action' }
    within('#rating') { expect(page).to have_css("img[src*='18']") }
    within('#blu_ray_stock') { expect(page).to have_content '10' }
  end
end