require 'rails_helper'

RSpec.feature 'Viewing films when User or Admin' do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let(:film1) { FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film') }

  scenario 'as a user' do
    login_as(user)
    visit film_path(film1)

    expect(page).to have_content 'Alien'
    expect(page).to have_content 'A good film'
    expect(page).to have_content '1979'

    within('#genre') { expect(page).to have_content 'Action / Horror' }
    within('#rating') { expect(page).to have_css("img[src*='18']") }
    within('#main_image') { expect(page).to have_css("img[src*='alien']") }
    expect(page).not_to have_content 'Blu-Ray Stock:'
    expect(page).not_to have_content 'DVD Stock'
    expect(page).not_to have_content 'Film Active:'
    expect(page).to have_button('Add to Rental List')
  end

  scenario 'as a admin' do
    login_as(admin_user)
    visit film_path(film1)

    expect(page).to have_content 'Alien'
    expect(page).to have_content 'A good film'
    expect(page).to have_content '1979'

    within('#genre') { expect(page).to have_content 'Action / Horror' }
    within('#rating') { expect(page).to have_css("img[src*='18']") }
    within('#main_image') { expect(page).to have_css("img[src*='alien']") }
    within('#blu_ray_stock') { expect(page).to have_content '10' }
    within('#dvd_stock') { expect(page).to have_content '5' }
    within('#film_active') { expect(page).to have_content 'true' }

    expect(page).to have_content 'Edit Film'
    expect(page).to have_content 'Delete Film'
  end
end