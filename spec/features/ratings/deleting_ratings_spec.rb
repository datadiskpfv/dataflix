require 'rails_helper'

RSpec.feature ' Users can delete ratings' do

  scenario 'with valid credentials' do

    FactoryGirl.create(:rating, rating: '20')

    visit '/ratings'
    click_link 'delete_20'

    expect(page).to have_content '18'
    expect(page).not_to have_content '20'
  end
end