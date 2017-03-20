require 'rails_helper'

RSpec.feature 'Users can view genres' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
  end

  scenario 'with the genre details' do
    visit genres_path

    expect(page).to have_selector('#edit_Horror')
    expect(page).to have_selector('#delete_Horror')

    expect(page).to have_selector('#edit_Action')
    expect(page).to have_selector('#delete_Action')
  end
end