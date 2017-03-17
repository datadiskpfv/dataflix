require 'rails_helper'

RSpec.feature 'Users can view postcodes' do

  before do
    postcode1 = FactoryGirl.create(:postcode, postcode: 'MK10 6DW')
    postcode2 = FactoryGirl.create(:postcode, postcode: 'MK10 7DW')

    visit '/admin/postcodes'
  end

  scenario 'with the film details' do
    expect(page).to have_content 'MK10 6DW'
    expect(page).to have_content 'MK10 7DW'
  end
end