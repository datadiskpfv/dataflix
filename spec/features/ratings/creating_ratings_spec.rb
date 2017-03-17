require 'rails_helper'

RSpec.feature 'Users can create new ratings' do

  before do
    visit admin_root_path
    click_link 'Create Rating'
  end

  scenario 'with validate credentials' do
    fill_in 'Rating', with: '20'
    click_button 'Create Rating'

    expect(page).to have_content 'Rating has been created.'

    visit ratings_path
    click_link 'delete_20'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Rating'

    expect(page).to have_content 'Rating has not been created.'
    expect(page).to have_content "Rating can't be blank"
  end
end