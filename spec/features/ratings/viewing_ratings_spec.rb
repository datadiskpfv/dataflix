require 'rails_helper'

RSpec.feature 'Users can view ratings' do

  scenario 'with the rating details' do
    rating1 = FactoryGirl.create(:rating, rating: '18')
    rating2 = FactoryGirl.create(:rating, rating: '16')

    visit '/ratings'

    expect(page).to have_selector('#edit_18')
    expect(page).to have_selector('#delete_18')

    expect(page).to have_selector('#edit_16')
    expect(page).to have_selector('#delete_16')
  end
end