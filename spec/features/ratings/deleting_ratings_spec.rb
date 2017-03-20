require 'rails_helper'

RSpec.feature ' Users can delete ratings' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin_user)
  end

  let!(:rating) { FactoryGirl.create(:rating, rating: '20') }

  scenario 'with valid credentials' do
    visit ratings_path
    click_link 'delete_20'

    expect(page).to have_content '18'
    expect(page).not_to have_content '20'
  end
end