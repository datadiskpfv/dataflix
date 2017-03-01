require 'rails_helper'

RSpec.feature 'Users can create new ratings' do

  before do
    visit '/admin'
    click_link 'Create Rating'
  end

  scenario 'with validate credentials' do
    fill_in 'Rating', with: '18'
    click_button 'Create Rating'

    expect(page).to have_content 'Rating has been created.'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Rating'

    expect(page).to have_content 'Rating has not been created.'
    expect(page).to have_content "Rating can't be blank"
  end
end