require 'rails_helper'

RSpec.feature 'Users can create new films' do

  before do
    visit '/admin'
    click_link 'Create Film'
  end

  scenario 'with validate credentials' do
    fill_in 'Title', with: 'Alien'
    fill_in 'Description', with: 'A ScFi horror movie about a crew in deep space'
    select 'Horror', from: 'Genre1'
    select 'Action', from: 'Genre2'
    select '18', from: 'Rating'
    fill_in 'Release Year', with: '1979'
    attach_file "Image 1", "spec/fixtures/alien.jpg"
    click_button 'Create Film'

    expect(page).to have_content 'Film has been created'
    expect(page).to have_content 'Alien'
    expect(page).to have_content '1979'
    within('#genre') do
      expect(page).to have_content 'Horror / Action'
    end
    within('#rating') do
      expect(page).to have_css("img[src*='18']")
    end
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Film'

    expect(page).to have_content 'Film has not been created.'
    expect(page).to have_content "Title can't be blank"
  end
end