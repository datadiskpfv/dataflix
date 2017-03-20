require 'rails_helper'

RSpec.feature ' Users can edit ratings' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
  end

  scenario 'with valid credentials' do
    visit ratings_path
    click_link "edit_18"

    fill_in 'Rating', with: '16'
    click_button 'Update Rating'

    expect(page).to have_content 'Rating has been updated.'
    expect(page).to have_content '16'

    visit ratings_path
    click_link "edit_16"
    fill_in 'Rating', with: '18'
    click_button 'Update Rating'
  end
end