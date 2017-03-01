require 'rails_helper'

RSpec.feature ' Users can edit genres' do

  scenario 'with valid credentials' do
    genre = FactoryGirl.create(:genre, genre: 'Horror')

    visit '/genres'
    click_link 'edit_Horror'

    fill_in 'Genre', with: 'ScFi'
    click_button 'Update Genre'

    expect(page).to have_content 'Genre has been updated.'
    expect(page).to have_content 'ScFi'
  end
end