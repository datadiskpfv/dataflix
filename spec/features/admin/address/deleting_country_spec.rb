require 'rails_helper'

RSpec.feature ' Users can delete countries' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let!(:country1) { FactoryGirl.create(:country, country: 'United States of America') }
  let!(:country2) { FactoryGirl.create(:country, country: 'England')}

  before do
    login_as(admin_user)
    visit admin_root_path
    click_link 'Country Area'
  end

  scenario 'with valid credentials' do
    find('#delete_england').click

    expect(page).to have_content 'Country has been deleted.'
    expect(page).not_to have_content 'England'
    expect(page).to have_content 'United States of America'
  end
end