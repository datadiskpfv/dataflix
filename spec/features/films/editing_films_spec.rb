require 'rails_helper'

RSpec.feature ' Users can edit films' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let(:film1) { FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film', image1: 'alien.jpg') }

  before do
    puts "Film main image is: #{film1.image1}"
    login_as(admin_user)
    visit film_path(film1)
  end

  scenario 'with valid credentials' do
    click_link 'Edit Film'

    fill_in 'Description', with: 'A very good film'
    select 'Horror', from: 'Genre1'
    select 'Action', from: 'Genre2'
    select '18', from: 'Rating'
    fill_in 'Release Year', with: '1979'
    fill_in 'Blu-Ray Stock', with: 10
    fill_in 'DVD Stock', with: 5
    check 'Is film active?'
    click_button 'Update Film'

    expect(page).to have_content 'Film has been updated.'
    expect(page).to have_content 'A very good film'
    expect(page).to have_content '1979'

    within('#blu_ray_stock') { expect(page).to have_content 10 }
    within('#dvd_stock') { expect(page).to have_content 5 }
    within('#genre') { expect(page).to have_content 'Horror / Action' }
    within('#rating') { expect(page).to have_css("img[src*='18']") }
    within('#main_image') { expect(page).to have_css("img[src*='alien.jpg']") }
    within('#film_active') { expect(page).to have_content 'true' }
  end
end