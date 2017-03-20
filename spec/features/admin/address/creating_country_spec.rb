require 'rails_helper'

RSpec.feature 'Users can create new countries' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
    visit admin_root_path
    click_link 'Create Country'
  end

  scenario 'with validate credentials' do
    fill_in 'Country', with: 'United States of America'
    click_button 'Create Country'

    expect(page).to have_content 'Country has been created'
    expect(page).to have_content 'United States of America'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Country'

    expect(page).to have_content 'Country has not been created.'
    expect(page).to have_content "Country can't be blank"
  end
end