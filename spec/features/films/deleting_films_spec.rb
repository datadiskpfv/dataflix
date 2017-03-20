require 'rails_helper'

RSpec.feature ' Users can delete films' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let(:film1) { FactoryGirl.create(:film, :img1, title: 'Black Mass', description: 'Another good film') }
  let!(:film2) { FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film', image1: 'alien.jpg') }

  scenario 'with valid credentials' do

    login_as(admin_user)
    visit film_path(film1)
    click_link 'Delete Film'

    expect(page).to have_css("img[src*='alien.jpg']")
  end
end