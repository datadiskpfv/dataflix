require 'rails_helper'

RSpec.feature ' Users can delete addresses' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let(:country) { FactoryGirl.create(:country, country: 'England') }
  let(:county) { FactoryGirl.create(:county, county: 'Buckinghamshire', country: country) }
  let(:postcode1) { FactoryGirl.create(:postcode, postcode: 'MK10 7DW') }
  let(:postcode2) { FactoryGirl.create(:postcode, postcode: 'MK10 6DW') }
  let!(:address1) { FactoryGirl.create(:address, county: county, country: country, postcode: postcode1) }
  let!(:address2) { FactoryGirl.create(:address, house_name: 'The Cottage', county: county, country: country, postcode: postcode2) }

  before do
    login_as(admin_user)
    visit admin_addresses_path
  end

  scenario 'with valid credentials' do
    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'

    find('#delete_the_barn_mk10_7dw').click

    expect(page).to have_content 'Address has been deleted.'
    expect(page).not_to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
    expect(page).to have_content 'The Cottage 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 6DW'
  end
end