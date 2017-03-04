require 'rails_helper'

RSpec.feature ' Users can edit ratings' do

  scenario 'with valid credentials' do
    visit '/ratings'
    click_link "edit_18"

    fill_in 'Rating', with: '16'
    click_button 'Update Rating'

    expect(page).to have_content 'Rating has been updated.'
    expect(page).to have_content '16'
  end
end