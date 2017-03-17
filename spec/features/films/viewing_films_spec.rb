require 'rails_helper'

RSpec.feature 'Users can view films' do

  let!(:film1) { FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film') }

  before do
    visit film_path(film1)
  end

  scenario 'with the film details' do
    expect(page).to have_content 'Alien'
    expect(page).to have_content 'A good film'
    expect(page).to have_content '1979'

    within('#genre') { expect(page).to have_content 'Action / Horror' }
    within('#rating') { expect(page).to have_css("img[src*='18']") }
    within('#main_image') { expect(page).to have_css("img[src*='alien']") }
    within('#blu_ray_stock') { expect(page).to have_content '10' }
    within('#dvd_stock') { expect(page).to have_content '5' }
    within('#film_active') { expect(page).to have_content 'true' }
  end
end