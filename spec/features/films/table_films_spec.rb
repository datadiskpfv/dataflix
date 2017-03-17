require 'rails_helper'

RSpec.feature 'Test films table view' do

  ## added trait (imgX) to be able to switch images
  let!(:film1) { FactoryGirl.create(:film, :img1, title: 'Black Mass', description: 'A good film', genre1_id: '6', image1: 'black_mass.jpg') }
  let!(:film2) { FactoryGirl.create(:film, :img2, title: 'Alien', description: 'A good film', genre1_id: '1') }

  before do
    visit films_path

    puts "Film1 image: #{film1.image1}"
    puts "Film2 image: #{film2.image1}"
  end

  scenario 'list action only movies' do
    within('.grey_box') { click_link 'Action' }

    expect(page).to have_content 'Films (Action)'
    expect(page).to have_content 'Black Mass'
    expect(page).not_to have_content 'Alien'
    within('.table-paginate') { expect(page).to have_css("img[src*='black-mass']") }
  end

  scenario 'list horror only movies' do
    click_link 'Horror'
    expect(page).to have_content 'Films (Horror)'
    expect(page).to have_content 'Alien'
    expect(page).not_to have_content 'Black Mass'
    within('.table-paginate') { expect(page).to have_css("img[src*='alien']") }
  end

end