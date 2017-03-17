require 'rails_helper'

RSpec.feature 'Users can create new postcode' do

  before do
    visit admin_root_path
    click_link 'Create Postcode'
  end

  scenario 'with validate credentials' do
    fill_in 'Postcode', with: 'MK10 7DW'
    click_button 'Create Postcode'

    expect(page).to have_content 'Postcode has been created'
    expect(page).to have_content 'MK10 7DW'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Postcode'

    expect(page).to have_content 'Postcode has not been created.'
    expect(page).to have_content "Postcode can't be blank"
  end
end