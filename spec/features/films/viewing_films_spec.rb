require 'rails_helper'

RSpec.feature 'Users can view films' do

  before do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/films'
  end

  scenario 'with the film details', js: true do
    within('.grey_box') { click_link 'Action' }
    #within('.action') { find(:css, 'img[src*="alien.jpg"]').click }
    #byebug

    #expect(page.current_url).to eq film_url(film)
    #expect(page).to have_content 'Alien'
    #expect(page).to have_content 'A good film'
    #expect(page).to have_content '1979'

    #within('#genre') { expect(page).to have_content 'Horror / Action' }
    #within('#rating') { expect(page).to have_css("img[src*='18']") }
    #within('#main_image') { expect(page).to have_css("img[src*='alien']") }
    #within('#blu_ray_stock') { expect(page).to have_content '10' }
    #within('#dvd_stock') { expect(page).to have_content '5' }
    #within('#film_active') { expect(page).to have_content 'true' }
  end
end