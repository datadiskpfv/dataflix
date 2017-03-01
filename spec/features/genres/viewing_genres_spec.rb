require 'rails_helper'

RSpec.feature 'Users can view genres' do

  scenario 'with the genre details' do
    genre1 = FactoryGirl.create(:genre, genre: 'Horror')
    genre2 = FactoryGirl.create(:genre, genre: 'ScFi')

    visit '/genres'

    expect(page).to have_selector('#edit_Horror')
    expect(page).to have_selector('#delete_Horror')

    expect(page).to have_selector('#edit_ScFi')
    expect(page).to have_selector('#edit_ScFi')
  end
end