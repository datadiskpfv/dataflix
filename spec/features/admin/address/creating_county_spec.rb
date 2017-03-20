require 'rails_helper'

RSpec.feature 'Users can create new counties' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
    visit admin_root_path
    click_link 'Create County'
  end

  scenario 'with validate credentials' do
    fill_in 'County', with: 'Buckinghamshire'
    click_button 'Create County'

    expect(page).to have_content 'County has been created'
    expect(page).to have_content 'Buckinghamshire'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create County'

    expect(page).to have_content 'County has not been created.'
    expect(page).to have_content "County can't be blank"
  end
end