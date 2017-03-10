require 'rails_helper'

RSpec.feature ' Users can delete films' do

  scenario 'with valid credentials' do

    film1 = FactoryGirl.create(:film, :img1, title: 'Black Mass', description: 'Another good film')
    film2 = FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film', image1: 'alien.jpg')

    visit '/films/1'
    click_link 'Delete Film'

    expect(page).to have_css("img[src*='alien.jpg']")
  end
end