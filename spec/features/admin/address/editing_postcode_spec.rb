require 'rails_helper'

RSpec.feature ' Users can edit postcode' do

  before do
    postcode1 = FactoryGirl.create(:postcode, postcode: 'MK10 6DW')
    postcode2 = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')

    visit '/admin/postcodes'
  end

  scenario 'with valid credentials' do
    find('#edit_mk10_6dw').click

    fill_in 'Postcode', with: 'MK10 8DW'
    click_button 'Update Postcode'

    expect(page).to have_content 'Postcode has been updated.'
    expect(page).not_to have_content 'MK10 6DW'
    expect(page).to have_content 'MK10 7DW'
    expect(page).to have_content 'MK10 8DW'
  end
end