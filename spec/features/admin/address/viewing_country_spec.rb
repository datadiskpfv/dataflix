require 'rails_helper'

RSpec.feature 'Users can view countries' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let!(:country1) { FactoryGirl.create(:country, country: 'United States of America') }
  let!(:country2) { FactoryGirl.create(:country, country: 'England') }

  before do
    login_as(admin_user)
    visit admin_countries_path
  end

  scenario 'with the film details' do
    expect(page).to have_content 'England'
    expect(page).to have_content 'United States of America'
  end
end