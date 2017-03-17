require 'rails_helper'

RSpec.feature 'Users can view genres' do

  scenario 'with the genre details' do
    visit genres_path

    expect(page).to have_selector('#edit_Horror')
    expect(page).to have_selector('#delete_Horror')

    expect(page).to have_selector('#edit_Action')
    expect(page).to have_selector('#delete_Action')
  end
end