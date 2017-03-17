require 'rails_helper'

RSpec.feature ' Users can delete postcodes' do

  before do
    postcode1 = FactoryGirl.create(:postcode, postcode: 'MK10 6DW')
    postcode2 = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')

    visit '/admin/postcodes'
  end

  scenario 'with valid credentials' do
    find('#delete_mk10_6dw').click

    expect(page).to have_content 'Postcode has been deleted.'
    expect(page).not_to have_content 'MK10 6DW'
    expect(page).to have_content 'MK10 7DW'
  end
end