require 'rails_helper'

RSpec.feature ' Users can delete ratings' do

  scenario 'with valid credentials' do

    rating1 = FactoryGirl.create(:rating, rating: '18')
    rating2 = FactoryGirl.create(:rating, rating: '16')

    visit '/ratings'
    click_link 'delete_16'

    expect(page).to have_content '18'
    expect(page).not_to have_content '16'
  end
end