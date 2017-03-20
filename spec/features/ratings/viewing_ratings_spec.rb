require 'rails_helper'

RSpec.feature 'Users can view ratings' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
  end

  scenario 'with the rating details' do
    visit ratings_path

    expect(page).to have_selector('#edit_18')
    expect(page).to have_selector('#delete_18')

    expect(page).to have_selector('#edit_15')
    expect(page).to have_selector('#delete_15')
  end
end