require 'rails_helper'

RSpec.feature 'Users can view postcodes' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let!(:postcode1) { FactoryGirl.create(:postcode, postcode: 'MK10 6DW') }
  let!(:postcode2) { FactoryGirl.create(:postcode, postcode: 'MK10 7DW') }

  before do
    login_as(admin_user)
    visit admin_postcodes_path
  end

  scenario 'with the film details' do
    expect(page).to have_content 'MK10 6DW'
    expect(page).to have_content 'MK10 7DW'
  end
end