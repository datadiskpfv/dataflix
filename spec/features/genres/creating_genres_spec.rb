require 'rails_helper'

RSpec.feature 'Users can create new genres' do

  before do
    visit '/admin'
    click_link 'Create Genre'
  end

  scenario 'with validate credentials' do
    fill_in 'Genre', with: 'Horror'
    click_button 'Create Genre'

    expect(page).to have_content 'Genre has been created'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Genre'

    expect(page).to have_content 'Genre has not been created.'
    expect(page).to have_content "Genre can't be blank"
  end
end