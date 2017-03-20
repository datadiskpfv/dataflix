require 'rails_helper'

RSpec.feature 'Users can view addresses' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let(:country) { FactoryGirl.create(:country, country: 'England') }
  let(:county) { FactoryGirl.create(:county, county: 'Buckinghamshire', country: country) }
  let(:postcode) { FactoryGirl.create(:postcode, postcode: 'MK10 7DW') }
  let!(:address) { FactoryGirl.create(:address, county: county, country: country, postcode: postcode) }

  before do
    login_as(admin_user)
    visit admin_addresses_path
  end

  scenario 'with the film details' do
    expect(page).to have_content 'The Barn 7, Nairn Grove, Broughton Gate, Milton Keynes, Buckinghamshire, England, MK10 7DW'
  end
end